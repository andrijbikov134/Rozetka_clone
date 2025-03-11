#!/bin/bash

FRONTEND_REPO="git@github.com:andrijbikov134/Rozetka_clone_Frontend.git"
BACKEND_REPO="git@github.com:andrijbikov134/Rozetka_clone_Backend.git"
DATABASE_REPO="git@github.com:andrijbikov134/Rozetka_clone_Database.git"
ROZETKA_REPO="git@github.com:andrijbikov134/Rozetka_clone.git"

WORKDIR="/home/familybykov05/"
FRONTEND_DIR="$WORKDIR/Rozetka_clone_Frontend"
BACKEND_DIR="$WORKDIR/Rozetka_clone_Backend"
DATABASE_DIR="$WORKDIR/Rozetka_clone_Database"
ROZETKA_DIR="$WORKDIR/Rozetka_clone"

DOCKER_FRONTEND="frontend"
DOCKER_BACKEND="rozetka_clone-backend-1"
DOCKER_DATABASE="rozetka_clone-database-1"

DATABASE_USER="root"
DATABASE_PASS="XXXXXXXXXXXXXXXXXXX"

TEXT="{
  "type": "service_account",
  "project_id": "arctic-marking-450608-f8",
  "private_key_id": "6f543f6e33290efc1c1afbab5e2dac18515dade4",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDEKSFF/hbUZVez\nlxWiumJN9O6tRiW0iDSsYzt8QIThqf9YmWNMlkjYf8U2MJGcrzDQUaF6P5F+2WVe\nAtEdRtdsunLcI/0D1QW+t97UcaIBfjT3Ijef8ed/qliVoTTXJu3I3w29VH/jD5Dp\nB9dPKbQkMDXwDj7B8iKIrMhZLP/G785bFrUiw/B8dpwAtvzJcYFZtoxEWeREUrb/\nf+1yrgF4NnB9W6dfgCoFsttQVnBL0PlK0vkapPm9vMTNi/fszARNeB/jI8AyUH/y\nkNH9naQreOEp95KwjGEF0rTKFlDfWuM/CazhyTdvnqGFPTApwu4rXJxe7AB9fE+R\njE22VuRxAgMBAAECggEAAYe9m/Vruavxt3OwBkU0c527x+vCawpd+NNMWT+KmdUQ\n6iDGMsiAWHoEsJPH6wQ92f4tB45b5PSuswFMHtGY6B77Oubn+CHvCcoW6araQ+83\nXA8vBmclcmxChSZNCnmiBL1its2kMsICFCNMxXASmO6sWQtPZ4VrSgwpAvMUKrnc\nLao7FwL5Af033dG4ghmGuZZoFYsHXOPW6iB9gtKcCnqmiUMFkqZVxCvJW6AaFUrD\nEOM18iXWpjMgB/slDi8Efy5Xx58uC06fXN/r8G4tqKSE7whPHG5iZgsJww+Tp23o\nXcBSjbY23x9URDKhZOLP5K2WuYoSeUSq3THzN+qdDQKBgQDwqPJT5+kyxVkBpz7I\neVNdmAKMCyFZBpJdwsJCeLs8xJX5BSOcOK6NoE+XPKMDekxKzesbUDo2/xrdQoUW\nr/G7VQz0fqCq+cVpzkg0m45IrtQqTNIu9k6sqUcCE6/DCTQ2hV+jXpp5CRPG+CLs\nXIEssoNysp3t6QirVgFxDt5JxQKBgQDQqgz31ExFzwmlWMzKH0dprVuJEvvAfB3V\nT5DoiPj4e7L8dU+JIBrinvIV7apOs81b6s2pSNXE2olAvuPPbCKtBIQ5zm/4z45h\noPL1FeO/uSSdDNg0acAbDFW3a38bioJpTAjGBX1RMn2j1SJ7H+Zbc9mWRKEwE/Fi\ndHgApg2WvQKBgQDgQa6+vWazJu8P+Vcp3NTwbExDT8Pdf6A4utnmszZXJCFUkZNj\nafZOh0pjdd+5x+b79fLV2ubEhOf1spzuTToHBPQziSQS7vkk5VKnoyTtWezfFgLu\nPBuIDZ3bs5ifOB5th89dHzT3AJxrVqLEelbs3dRbt1Ivdm3bqyNgxSgiuQKBgQCG\nqReRYIqQippZAMO4tRLrGht2jK+3euHt5VlJGAxEn9/UmQhpIDT5h0YH7Mb534Nq\nDFAJLZ33Wmk1RXvTQp/mNIH4pEcStS/XxXzFugiulBcS21U0DgMR8ZXntxHifjLH\nLXCECsri+cinUEbeWqnY3xzOox+63UPsG+nN0Vv3qQKBgHBDMnrc3e8olEDdlex8\n+Ci8dCwy/IouLNeY/jN2Go+tBr+1CJAsDpizZbwKsVd4TBrn1PWCCYXY8SNo0tyE\nda3MiWstpU52bMXWA7CCQpzJGt2DDt9zzPwnXedcx8hzfSzDLnmtjglcm5IMIm16\nqaTduVbfH5NEDMz928Fry/tj\n-----END PRIVATE KEY-----\n",
  "client_email": "clothes-store-admin@arctic-marking-450608-f8.iam.gserviceaccount.com",
  "client_id": "112650517239315120432",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/clothes-store-admin%40arctic-marking-450608-f8.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}"

# Оновлення репозиторіїв
echo "Оновлення коду..."

cd $FRONTEND_DIR

if [ "$(git rev-parse HEAD)" != "$(git ls-remote origin -h refs/heads/main | awk '{print $1}')" ]; then
    echo "Внесено зміни в Frontend, перезапускаємо Frontend..."
    git pull origin main
    rm -rf $ROZETKA_DIR/frontend/*
    cp -r $FRONTEND_DIR/* $ROZETKA_DIR/frontend/
    sed -i "s|const localhostFrontend = 'http://localhost:5173';|//const localhostFrontend = 'http://localhost:5173';|" "$ROZETKA_DIR/frontend/src/App.jsx"
    sed -i "s|//const localhost = 'https://192.168.0.113:8080';|const localhostFrontend = 'https://nfv.pp.ua';|" "$ROZETKA_DIR/frontend/src/App.jsx"
    sed -i "s|const localhost = 'http://localhost:8888';|//const localhost = 'http://localhost:8888';|" "$ROZETKA_DIR/frontend/src/App.jsx"
    sed -i "s|//const localhost = 'https://192.168.0.113:8080/api';|const localhost = 'https://nfv.pp.ua/api';|" "$ROZETKA_DIR/frontend/src/App.jsx"
    cd $ROZETKA_DIR
    chown -R familybykov05:familybykov05 ./frontend/*
    chmod -R 777 ./frontend/node_modules
    docker compose up -d --build $DOCKER_FRONTEND
else
    echo "Ніяких змін в Frontend, Frontend не перезапускаємо."
fi

cd $BACKEND_DIR

if [ "$(git rev-parse HEAD)" != "$(git ls-remote origin -h refs/heads/main | awk '{print $1}')" ]; then
    echo "Внесено зміни в Backend, перезапускаємо Backend..."
    git pull origin main
    rm -rf $ROZETKA_DIR/backend/*
    cp -r $BACKEND_DIR/* $ROZETKA_DIR/backend/
    sed -i "s|'dsn' => 'mysql:host=localhost;dbname=clothes_store',|'dsn' => 'mysql:host=database;dbname=clothes_store',|" "$ROZETKA_DIR/backend/app/config.php"
    sed -i "s|'user' => 'root',|'user' => trim(file_get_contents('/run/secrets/db_user')),|" "$ROZETKA_DIR/backend/app/config.php"
    sed -i "s|'password' => '',|'password' => trim(file_get_contents('/run/secrets/db_password')),|" "$ROZETKA_DIR/backend/app/config.php"
    cd $ROZETKA_DIR
    echo $TEXT > ./arctic-marking-450608-f8-6f543f6e3329.json
    docker exec -it $DOCKER_BACKEND bash -c "rm -R /var/www/html/*"
    docker cp ./backend/. $DOCKER_BACKEND:/var/www/html/
    docker exec -it $DOCKER_BACKEND bash -c "apt-get update && apt-get install -y default-mysql-client && docker-php-ext-install mysqli pdo_mysql"
    docker compose restart backend
else
    echo "Ніяких змін в Backend, Backend не перезапускаємо."
fi

cd $DATABASE_DIR
CHANGED=$(git status --porcelain | wc -l)

if [ "$(git rev-parse HEAD)" != "$(git ls-remote origin -h refs/heads/main | awk '{print $1}')" ]; then
    echo "Внесено зміни в Database, перезапускаємо Database..."
    git pull origin main
    rm $ROZETKA_DIR/database/clothes_store.sql
    cp $DATABASE_DIR/clothes_store.sql $ROZETKA_DIR/database/clothes_store.sql
    cd $ROZETKA_DIR
    docker exec -it $DOCKER_DATABASE mysql -u $DATABASE_USER -p$DATABASE_PASS -e "DROP DATABASE clothes_store; CREATE DATABASE clothes_store;"
    cat $ROZETKA_DIR/database/clothes_store.sql | docker exec -i $DOCKER_DATABASE mysql -u $DATABASE_USER -p$DATABASE_PASS clothes_store
else
    echo "Ніяких змін в Database, Database не перезапускаємо."
fi

echo "Оновлення завершено!"
