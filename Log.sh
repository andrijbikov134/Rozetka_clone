#!/bin/bash

LOG_FILE="/var/log/nginx/access.log"  
THRESHOLD=5  # Мінімальна кількість запитів для виявлення підозрілих IP
OUTPUT_FILE="suspicious_ips.txt"

echo "Аналіз логів на предмет підозрілих IP..." > "$OUTPUT_FILE"

# Витягнути логи у читабельний формат
jq -r '.log' "$LOG_FILE" > /tmp/parsed_logs.txt

# Виявлення IP, які надсилають забагато запитів
echo "Підозрілі IP за кількістю запитів (> $THRESHOLD запитів):" >> "$OUTPUT_FILE"
grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' /tmp/parsed_logs.txt | sort | uniq -c | sort -nr | awk -v threshold="$THRESHOLD" '$1 > threshold {print $2}' >> "$OUTPUT_FILE"

# Виявлення IP, що шукають конфіденційні файли
echo -e "\nIP, що намагалися отримати .env або SQL файли:" >> "$OUTPUT_FILE"
grep -E 'GET (/.env|/dump.sql)' /tmp/parsed_logs.txt | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort | uniq >> "$OUTPUT_FILE"

# Виявлення IP, що використовують підозрілі User-Agent (можливо, сканери)
echo -e "\nIP, що використовують підозрілі User-Agent:" >> "$OUTPUT_FILE"
grep -Ei 'zgrab|Keydrop|curl|Palo Alto|masscan|nikto|sqlmap|nmap' /tmp/parsed_logs.txt | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort | uniq >> "$OUTPUT_FILE"

echo "Аналіз завершено. Результати у файлі $OUTPUT_FILE"