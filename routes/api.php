<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\CartController;
use App\Http\Controllers\API\CategoryController;
use App\Http\Controllers\API\CheckoutController;
use App\Http\Controllers\API\FrontendController;
use App\Http\Controllers\API\OrderController;
use App\Http\Controllers\API\ProductController;

Route::post('register', [AuthController::class, 'register']);
Route::post('login',[AuthController::class, 'login']);

Route::get('getCategory', [FrontendController::class, 'category']);
Route::get('fetchproducts/{slug}', [FrontendController::class, 'product']);
Route::get('viewproductdetail/{category_slug}/{product_slug}', [FrontendController::class, 'viewproduct']);
Route::post('add-to-cart',[CartController::class, 'addtocart']);
Route::get('cart', [CartController::class, 'viewcart']);
Route::put('cart-updatequantity/{cart_id}/{scope}',[CartController::class, 'updatequantity']);
Route::delete('delete-cartitem/{cart_id}', [CartController::class, 'deleteCartitem']);


Route::post('place-order', [CheckoutController::class, 'placeorder']);

Route::middleware(['auth:sanctum','isAPIAdmin'])->group(function() {

    Route::get('/checkingAuthenticated',function() {
        return response()->json(['message'=>'You are in', 'status'=> 200], 200);
    });
    
    //Category
    Route::get('view-category',[CategoryController::class, 'index']);
    Route::post('store-category', [CategoryController::class, 'store']);
    Route::get('edit-category/{id}', [CategoryController::class, 'edit']);
    Route::put('update-category/{id}', [CategoryController::class, 'update']);
    Route::delete('delete-category/{id}', [CategoryController::class, 'destroy']);
    Route::get('all-category', [CategoryController::class, 'allcategory']);

    //Orders
    Route::get('admin/orders', [OrderController::class, 'index']);

    //Product
    Route::post('store-product',[ProductController::class, 'store']);
    Route::get('view-product',[ProductController::class, 'index']);
    Route::get('edit-product/{id}',[ProductController::class, 'edit']);
    Route::post('update-product/{id}',[ProductController::class, 'update']);

});

Route::middleware(['auth:sanctum'])->group(function() {

  

    Route::post('logout', [AuthController::class, 'logout']);
});

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
//lệnh php artisan make:migration create_products_table là tạo bảng table trong migration
//php artisan migrate là đẩy lên database 
//tạo lớp product lệnh : php artisan make:model Product
//tạo lớp controller lệnh php artisan make:controller API/ProductController
