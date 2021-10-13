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
<<<<<<< HEAD

=======
Route::post('/login', function () {
    return view('auth/login');
});
<<<<<<< HEAD
Route::get('/forgot-password', function () {
    return view('auth/forgot-password');
=======
>>>>>>> fa14d2857f34bfcfa40201ca072f00f06e7d6bd2
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
<<<<<<< HEAD
});
Route::get('/home', function () {
    return view('home');
=======
>>>>>>> 21a03d9df91f3b8bddac51906bc1ff07a94a32c3
>>>>>>> fa14d2857f34bfcfa40201ca072f00f06e7d6bd2
});