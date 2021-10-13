<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/forgot_password', function () {
    return view('auth/forgot_password');
});
Route::post('/forgot_password', function () {
    return view('auth/forgot_password');
});
Route::get('/reset-password', function () {
    return view('auth/reset-password');
});

Route::get('/password.update', function () {
    return view('auth/login');
});
Route::get('/home', function () {
    return view('home');
});