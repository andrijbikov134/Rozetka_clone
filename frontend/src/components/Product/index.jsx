import React, { useContext, useEffect, useId, useState } from 'react';
import styles from "./Product.module.css"
import { useNavigate } from 'react-router-dom';

const Product = (props) => {

  const [currentUser, setCurrentUser] = useState(0);
  const navigate = useNavigate();

  const loadCurrentUser = () =>
  {
    let user = JSON.parse(localStorage.getItem('user_petrushka_style')) || [];
    if(user.length == 0)
    {
      setCurrentUser(JSON.parse(sessionStorage.getItem('user_petrushka_style')) || 0);
    }
    else
    {
      setCurrentUser(user);
    }
  }
  // Функція, яка спрацьовує під час натискання кнопки "Add"
  const handleAddEventClick = () => 
  {
    props.handleAddEventClick(inputEventTextId)
  }

  // Функція натискання клавіш у полі введення тексту нової події
  const handleAddEventKeyDown = (event) => 
  {
    if(event.key === "Enter")
    {
      handleAddEventClick();
    }
  }

  // Функція натискання на малюнок редагування події
  const handleEditEventClick = (event) => 
  {
    props.editEvent(event.target);
  }

  // Функція натискання на Enter в полі введення події, яка редагується
  const handleEditEventEnter = (event) => 
  {
    let target = event.target;
    if(event.key === "Enter" && !target.classList.contains(styles.input_readonly))
    {
      // Отримуємо картинку редагування
      target = target.closest(`.${styles.event__container}`).getElementsByClassName(styles.event__button_edit)[0];
      // Відправити в функцію редагування події
      props.editEvent(target);
    }
  }

  const handlerOnClickProduct = () =>
  {
    props.handlerOnClickProduct(props.id);
  }

  const handlerOnClickEditProduct = () =>
  {
    props.handlerOnClickEditProduct(props.id);
  }

  const handlerOnClickCopyProduct = () =>
  {
    props.handlerOnClickCopyProduct();
  }

  const handlerOnClickDeleteProduct = () => 
  {
    props.handlerOnClickDeleteProduct(props.id, props.img);
  }

 

  useEffect(() => {
    loadCurrentUser();
  }, []);
  
  return (
      <>
      <div>
        <div className={styles.container_column} onClick={handlerOnClickProduct} data-id={props.id}>
          <img className={styles.img} src={props.googleBucketUrl + props.img} alt="" />
          <div className={styles.title}>{[props.title]}</div>
          <div className={styles.delivery_container}>
            <div className={styles.delivery_text}>
              <div >Готовий до відправлення </div> 
              <img className={styles.img_delivery} src={props.localhostFrontend + '/img/delivery_product.png'}/>
            </div>
            {
              props.new_product ? <div className={styles.new_product}>NEW</div> : ''
            }
            
          </div>
          
          {/* Якщо товар зі знижкою, то виводити знижку */}
          {
            props.priceWithDiscount != null ?
            <>
              <div className={styles.price}>{props.priceWithDiscount.toLocaleString('ua-UA')} грн.</div>
              <div className={styles.price_with_discount_container}>
                <div className={styles.price_with_discount}>{props.price.toLocaleString('ua-UA')} грн.</div>
                <div className={styles.discount_percent}>-{Math.floor((props.price - props.priceWithDiscount)/props.price*100)} %</div>
              </div>
            </> : 
            <>
              <div className={styles.price}>{props.price.toLocaleString('ua-UA')} грн.</div>
              <div className={styles.empty}></div>
            </>
          }
        </div>
        {
          currentUser != 0 ? (currentUser.role != 'Administrator' ? "" :
          <>
          <div>
            <div className={styles.buttons_container}>
                <div className={styles.button} onClick={handlerOnClickEditProduct}>Редагувати</div>
                <div className={styles.button} onClick={handlerOnClickCopyProduct}>Копіювати</div>
            </div>
            <div className={styles.buttons_container}>
              <div className={styles.button_hide} onClick={handlerOnClickEditProduct}>Приховати</div>
              <div className={styles.button_delete} onClick={handlerOnClickDeleteProduct}>Видалити</div>
            </div>
          </div>
          </>
          ) : ''
        }
      </div>
      </>
  );
}

export default Product;
