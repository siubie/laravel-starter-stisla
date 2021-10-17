<?php

use Illuminate\Support\Facades\Route;
use App\Models\User;
use App\Http\Controllers\UserController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth/login');
});

Route::group(['middleware' => ['auth']], function () {
    Route::get('/home', function () {
        return view('home', ['users' => User::get(),]);
    });
    Route::get('/table-user', function () {
        return view('table-user', ['users' => User::get(),]);
    });
    Route::get('/update-user/{id}', function () {
        return view('update-user', ['users' => User::get(),]);
    });
    // Route::get('myTable', [UserController::class, 'index']);
    Route::post('store-user', [UserController::class, 'store']);
    Route::post('edit-user', [UserController::class, 'edit']);
    Route::post('delete-user', [UserController::class, 'destroy']);
});