
import './App.css'

// Бібліотека для компонентів
import { useId, useEffect, useState, useContext } from 'react';
import { Route, Routes, useNavigate, useLocation } from 'react-router-dom';

import Header from './components/Header';
import Footer from './components/Footer';
import Feedback from './components/Feedback';
import Shops from './components/Shops';
import Contacts from './components/Contacts';
import Sizes from './components/Sizes';
import ScrollToTop from './components/ScrollToTop';
import Delivery from './components/Delivery';
import GiftCertificates from './components/GiftCertificates';
import QuestionsAndAnswers from './components/QuestionsAndAnswers';
import ListProducts from './components/ListProducts';
import CategoriesSubSub from './components/CategoriesSubSub';
import ListProductsSearchResult from './components/ListProductsSearchResult';
import ProductFull from './components/ProductFull';
import PaymentMethods from './components/PaymentMethods';
import Cart from './components/Cart';
import ProductsListWithFilters from './components/ProductsListWithFilters';
import PaymentCard from './components/PaymentCard';
import OrderAccepted from './components/OrderAccepted';
import Login from './components/LogInRegister/Login';
import Register from './components/LogInRegister/Register';
import Logout from './components/Logout';
import { CurrentUserContext } from './context';
import ProductNewEdit from './components/ProductNewEdit';
import ProfilePage from './components/ProfilePage';
import ProductsListSaleNew from './components/ProductsListSaleNew';


function App()
{
  const navigate = useNavigate();
  // Властивість, яка зберігає список товарів, отримуємо список товарів з контексту
  const [allProducts, setAllProducts] = useState([]);

  const input_search_id = useId();

  const [foundProducts, setFoundProducts] = useState([]);

  const [foundProduct, setFoundProduct] = useState([]);

  const [searchTitle, setSearchTitle] = useState('');

  const [cart, setCart] = useState(JSON.parse(localStorage.getItem('order_petrushka_style')) || []);

  const [cartCount, setCartCount] = useState(0);

  const [currentUser, setCurrentUser] = useState(0);

  //const localhostFrontend = 'http://localhost:5173';
  const localhostFrontend = 'https://nfv.pp.ua';

  //const localhost = 'http://localhost:8888';
  const localhost = 'https://nfv.pp.ua/api';

  const googleBucketUrl = 'https://storage.googleapis.com/clothes_store/';

  // Функція для разового створення JSON-файла
  const saveToLocalStorage = (key, array) =>
  {
    let json = JSON.stringify(array);
      localStorage.setItem(key,json);
  }

  const loadFromLocalStorage = (key, method) =>
  {
    let array = JSON.parse(localStorage.getItem(key)) || [];
    method(array);
  }

  // /index.php?name=asdasd&email=asd8&status=active&type=publisher&ssn=2342&action=create
  const loadPopularProducts = () =>
  {
    fetch(`${localhost}/index.php?action=getPopularProducts`, {
      method: 'POST',
      header: {
        'Content-Type': 'application/json', 
      },
      body: JSON.stringify({action: 1})
    })
    .then(response =>
      response.json()
      )
    .then(response => {
      setAllProducts(response);
    })
    
  }

  const handlerSearchProducts = (input_title) =>
  {
    if(input_title != '')
    {
      navigate(`/search_result/title=${input_title}`, {state:{input_title: input_title}});     
    }
  }

  const handlerSearchTitleClean = () =>
  {
    document.getElementById(input_search_id).value = '';
  }

  const handlerOnClickProduct = (product_id) =>
  {
    navigate(`/product/${product_id}`);
  }

  const handlerOnClickAddToCart = (product, size, color) =>
  {
    let newCart = cart.map((item) => item);
    let foundProduct = newCart.filter((item) =>
    {
      return (item.product.id == product.id && item.size.id == size.id);
    });
    if(foundProduct.length == 0)
    {
      newCart.push(
        {
          product: product,
          size: size,
          color: color,
          quantity: 1
        }
      );
    }
    else
    {
      let oldQuantity = foundProduct[0].quantity || 1;
      newCart = cart.map((item) =>
      {
        if(item.product.id == product.id && item.size.id == size.id)
        {
          return {
            product: item.product,
            size: item.size,
            color: item.color,
            quantity: oldQuantity + 1
          };
        }
        else{
          return item;
        }
      })
    }
    setCart(newCart);
  }

  const handlerOnClickDelete = (product_id, size_id) =>
  {
    let newArr = cart.filter((item) =>
      {
        return !(item.product.id == product_id && item.size.id == size_id);
      });
    setCart(newArr);
  }

  const updateCartCount = () =>
  {
    let newCartCount = cart.reduce((accumulator, {quantity}) => accumulator + quantity,0);
    setCartCount(newCartCount);
  }

  const updateCart = () =>
  {
    loadFromLocalStorage('order_petrushka_style',setCart);
  }

  const loadCurrentUser = () =>
  {
    //loadFromLocalStorage('user_petrushka_style', setCurrentUser);
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

  /////////////////////////////////////////////////////////////////
  // Хук, який спрацьовує на зміну foundProducts та виконує функції оновлення та зберігання значення
  useEffect(() =>
  {
    loadPopularProducts();  
  },
  [foundProducts])

  useEffect(() =>
    {
      updateCartCount();
      saveToLocalStorage('order_petrushka_style',cart);
    },
  [cart])

  useEffect(() =>
    {
      saveToLocalStorage('current_product_petrushka_style', foundProduct);
    },
  [foundProduct])

  useEffect(() =>
    {
      loadFromLocalStorage('order_petrushka_style',setCart);
      loadCurrentUser();
    },
  [])
  
  return (
    <>
        <Header handlerSearchProducts={handlerSearchProducts} search_title={searchTitle} input_search_id={input_search_id} cart_count={cartCount} localhost={localhost} localhostFrontend={localhostFrontend} user={currentUser}/>
        <div className="main_block">
          <ScrollToTop/>
          <Routes>
            <Route path='/' element={<ListProducts action='getPopularProducts' title='ПОПУЛЯРНІ ТОВАРИ' handlerSearchTitleClean={handlerSearchTitleClean} handlerOnClickProduct={handlerOnClickProduct} localhost={localhost} localhostFrontend={localhostFrontend} googleBucketUrl={googleBucketUrl}/>}/>
            <Route path='/women/clothes' element={<CategoriesSubSub category='women' category_sub='clothes' localhost={localhost} googleBucketUrl={googleBucketUrl} />} />
            <Route path='/women/clothes/*' element={<ProductsListWithFilters action='getProductsWithoutFilters' category='women' category_sub='clothes' localhost={localhost} localhostFrontend={localhostFrontend} handlerOnClickProduct={handlerOnClickProduct} googleBucketUrl={googleBucketUrl}/>} />

            <Route path='/women/shoes' element={<CategoriesSubSub category='women' category_sub='shoes' localhost={localhost} googleBucketUrl={googleBucketUrl}/>} />
            <Route path='/women/shoes/*' element={<ProductsListWithFilters action='getProductsWithoutFilters' category='women' category_sub='shoes' localhost={localhost} localhostFrontend={localhostFrontend} handlerOnClickProduct={handlerOnClickProduct} googleBucketUrl={googleBucketUrl}/>} />

            <Route path='/women/accessories' element={<CategoriesSubSub category='women' category_sub='accessories' localhost={localhost} googleBucketUrl={googleBucketUrl}/>} />
            <Route path='/women/accessories/*' element={<ProductsListWithFilters action='getProductsWithoutFilters' category='women' category_sub='accessories' localhost={localhost} localhostFrontend={localhostFrontend} handlerOnClickProduct={handlerOnClickProduct} googleBucketUrl={googleBucketUrl}/>} />

            <Route path='/men/clothes' element={<CategoriesSubSub category='men' category_sub='clothes' localhost={localhost} googleBucketUrl={googleBucketUrl}/>} />
            <Route path='/men/clothes/*' element={<ProductsListWithFilters action='getProductsWithoutFilters' category='men' category_sub='clothes' localhost={localhost} localhostFrontend={localhostFrontend} handlerOnClickProduct={handlerOnClickProduct} googleBucketUrl={googleBucketUrl}/>} />
            
            <Route path='/men/shoes' element={<CategoriesSubSub category='men' category_sub='shoes' localhost={localhost} googleBucketUrl={googleBucketUrl}/>} />
            <Route path='/men/shoes/*' element={<ProductsListWithFilters action='getProductsWithoutFilters' category='men' category_sub='shoes' localhost={localhost} localhostFrontend={localhostFrontend} handlerOnClickProduct={handlerOnClickProduct} googleBucketUrl={googleBucketUrl}/>}  />

            <Route path='/men/accessories' element={<CategoriesSubSub category='men' category_sub='accessories' localhost={localhost}googleBucketUrl={googleBucketUrl}/>} />
            <Route path='/men/accessories/*' element={<ProductsListWithFilters action='getProductsWithoutFilters' category='men' category_sub='accessories' localhost={localhost} localhostFrontend={localhostFrontend} handlerOnClickProduct={handlerOnClickProduct} googleBucketUrl={googleBucketUrl}/>} />

            <Route path='/children/clothes' element={<CategoriesSubSub category='children' category_sub='clothes' localhost={localhost} googleBucketUrl={googleBucketUrl}/>}  />
            <Route path='/children/clothes/*' element={<ProductsListWithFilters action='getProductsWithoutFilters' category='children' category_sub='clothes' localhost={localhost} localhostFrontend={localhostFrontend} handlerOnClickProduct={handlerOnClickProduct} googleBucketUrl={googleBucketUrl}/>} />

            <Route path='/children/shoes' element={<CategoriesSubSub category='children' category_sub='shoes' localhost={localhost} googleBucketUrl={googleBucketUrl}/>} />
            <Route path='/children/shoes/*' element={<ProductsListWithFilters action='getProductsWithoutFilters' category='children' category_sub='shoes' localhost={localhost} localhostFrontend={localhostFrontend} handlerOnClickProduct={handlerOnClickProduct} googleBucketUrl={googleBucketUrl}/>} />

            <Route path='/children/accessories' element={<CategoriesSubSub category='children' category_sub='accessories' localhost={localhost} googleBucketUrl={googleBucketUrl}/>}  />
            <Route path='/children/accessories/*' element={<ProductsListWithFilters action='getProductsWithoutFilters' category='children' category_sub='accessories' localhost={localhost} localhostFrontend={localhostFrontend} handlerOnClickProduct={handlerOnClickProduct} googleBucketUrl={googleBucketUrl}/>} />

            <Route path='/product/*' element={<ProductFull handlerOnClickAddToCart={handlerOnClickAddToCart} localhost={localhost} localhostFrontend={localhostFrontend} loadFromLocalStorage={loadFromLocalStorage} googleBucketUrl={googleBucketUrl}/>}  />


            <Route path='/search_result/*' element={<ListProductsSearchResult products={foundProducts} search_title={searchTitle} localhost={localhost} localhostFrontend={localhostFrontend} handlerOnClickProduct={handlerOnClickProduct} googleBucketUrl={googleBucketUrl} handlerOnClickAddToCart={handlerOnClickAddToCart}/>}/>
            <Route path='/profile/*' element={<ProfilePage user={currentUser} localhost={localhost} localhostFrontend={localhostFrontend} loadCurrentUser={loadCurrentUser}/>}  />
            <Route path='/cart' element={<Cart currentUser={currentUser} handlerOnClickDelete={handlerOnClickDelete} updateCart={updateCart} localhost={localhost} localhostFrontend={localhostFrontend} googleBucketUrl={googleBucketUrl}/>}     />

            <Route path='/sale' element={<ProductsListSaleNew action={'getProductsSale'} title={'РОЗПРОДАЖ'} localhost={localhost} localhostFrontend={localhostFrontend} googleBucketUrl={googleBucketUrl} handlerOnClickProduct={handlerOnClickProduct}/>}/>
            <Route path='/newproducts' element={<ProductsListSaleNew  title={'НОВИНКИ'} action={'getProductsNew'} localhost={localhost} localhostFrontend={localhostFrontend} googleBucketUrl={googleBucketUrl} handlerOnClickProduct={handlerOnClickProduct}/>}/>

            <Route path='/shops' element={<Shops/>}/>
            <Route path='/contacts' element={<Contacts/>}/>
            <Route path='/sizes' element={<Sizes/>}/>
            <Route path='/paymentcard' element={<PaymentCard/>} />
            <Route path='/orderaccepted' element={<OrderAccepted localhost={localhost} localhostFrontend={localhostFrontend} updateCart={updateCart}/>} />
            <Route path='/delivery' element={<Delivery/>}/>
            <Route path='/paymentmethods' element={<PaymentMethods/>}/>
            <Route path='questionsandanswers' element={<QuestionsAndAnswers/>}/>
            <Route path='/giftcertificates' element={<GiftCertificates/>}/>
            <Route path="/feedback/*" element={<Feedback localhost={localhost}/>}/>

            <Route path='/login' element={<Login localhost={localhost} loadCurrentUser={loadCurrentUser}/>}/>
            <Route path='/register' element={<Register localhost={localhost}/>}/>
            <Route path='/logout' element={<Logout loadCurrentUser={loadCurrentUser}/>}/>

            <Route path='/addnewproduct' element={<ProductNewEdit localhost={localhost} googleBucketUrl={googleBucketUrl}/>}/>
          </Routes>
        </div>
        <Footer user={currentUser} localhostFrontend={localhostFrontend}/>
    </>
  )
}

export default App
