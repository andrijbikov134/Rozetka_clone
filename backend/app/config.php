<?php

return [
    'routes' => [
        'getpopularproducts' => 'OrderIdProductIdController@getPopularProducts',     // index.php?action=index
        'getcategoriessubsubbycategorysubandcategory' => 'ProductsController@getCategoriesSubSubByCategorySubAndCategory', 
          // index.php?action=delete&id=10
        'getproductsfilteredbytitle' => 'ProductsController@getProductsFilteredByTitle',   // index.php?action=delete&id=10
        'getproductbyid' => 'ProductsController@getProductById',
        'getproductswithoutfilters' => 'ProductsController@getProductsWithoutFilters',  
        'getproductswithfilters' => 'ProductsController@getProductsWithFilters',
        'getproductcharacteristics' => 'ProductsController@getProductCharacteristics',
        'getsaleproducts' => 'ProductsController@getSaleProducts',
        'getnewproducts' => 'ProductsController@getNewProducts',
        'getproductssale' => 'ProductsController@getProductsSale',
        'getproductsnew' => 'ProductsController@getProductsNew',

        'addorupdateproductindb' => 'ProductsController@addOrUpdateProductInDB',
        'deleteproductfromdb' => 'ProductsController@deleteProductFromDB',
        'deleteimgfromgooglebucket' => 'ProductsController@deleteImgFromGoogleBucket',

        
        
        
        // index.php?action=delete&id=10
        'createreview' => 'ReviewsController@putReviewDB',
        'getreviewsproductbyid' => 'ReviewsController@getReviewsProductById',
        
        'getproductsizes' => 'ProductIdSizeIdController@getProductSizes',
        
        'getsizebyid' => 'SizesController@getSizeById',
        'getsizesbycategorysub' => 'SizesController@getSizesByCategorySub',
        
        'getcolorbyid' => 'ColorsController@getColorById',
        
        'createorder' => 'OrdersController@createOrder',
        
        'loginuser' => 'UsersController@loginUser' ,
        'registeruser' => 'UsersController@registerUser' ,
        'getuserbyid' => 'UsersController@getUserById',
        'updateprofile' => 'UsersController@updateProfile',
        'change-password' => 'UsersController@changePassword',
        
        'getcategoriessub' => 'CategoriesSubController@getCategoriesSub' ,
        'getcategorysubtitlebyid' => 'CategoriesSubController@getCategorySubTitleById' ,
        
        'getcategorysubsubtitlebyid' => 'CategoriesSubSubController@getCategorySubSubTitleById' ,
        'getcategorysubsubtitleua' => 'CategoriesSubSubController@getCategorySubSubTitleUa',
        'getcategorysubsubbycategorytitle' => 'CategoriesSubSubController@getCategorySubSubByCategoryTitle',

        'getcategorytitlebyid' => 'CategoriesController@getCategoryTitleById' ,


        'getissaleproductsbyuser' => 'OrderIdProductIdController@getIsSaleProductsByUser' ,
        'getordersbyuserid' => 'OrdersController@getOrdersByUserId',


        'getallbrands' => 'FiltersController@getAllBrands', 
        'getallsizes' => 'FiltersController@getAllSizes',
        'getallmaterials' => 'FiltersController@getAllMaterials',
        'getallcolors' => 'FiltersController@getAllColors',
        'getallcountries' => 'FiltersController@getAllCountries',

    ],
    'service_container' => [
            'ProductsController' => [
            'class' => 'ProductModel',
            ],
            'ReviewsController' => [
            'class' => 'ReviewModel',
            ],
            'ProductIdSizeIdController' =>
            [
                'class' => 'ProductIdSizeIdModel',
            ], 
            'SizesController' =>
            [
                'class' => 'SizeModel',
            ], 
            'ColorsController' =>
            [
                'class' => 'ColorModel',
            ],
            'UsersController' =>
            [
                'class' => 'UserModel',
            ],
            'OrdersController' =>
            [
                'class' => 'OrderModel',
            ],
            'RecipientsController' =>
            [
                'class' => 'RecipientModel',
            ],
            'OrderIdProductIdController' =>
            [
                'class' => 'OrderIdProductIdModel',
            ],
            'CategoriesSubController' =>
            [
                'class' => 'CategorySubModel',
            ],
            'CategoriesController' =>
            [
                'class' => 'CategoryModel',
            ],
            'CategoriesSubSubController' =>
            [
                'class' => 'CategorySubSubModel',
            ],
            'FiltersController' =>
            [
                'class' => 'FilterModel',
            ]
               
    ],
    'params' => 
        [
        'dsn' => 'mysql:host=database;dbname=clothes_store',
        'user' => trim(file_get_contents('/run/secrets/db_user')),
        'password' => trim(file_get_contents('/run/secrets/db_password')),
        ]
];