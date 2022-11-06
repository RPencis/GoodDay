<?php

use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

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

Route::get('/blog/{blog}','App\Http\Controllers\BlogController@show')->name('blog.show');
Route::get('/news/{news}','App\Http\Controllers\NewsController@show')->name('news.show');

Route::get('/','App\Http\Controllers\IndexController@index')->name('home');

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {

    Route::get('/dashboard', function () {
        return Inertia::render('Dashboard');
    })->name('dashboard');

    //BLOG routes
    Route::get('/blog','App\Http\Controllers\BlogController@index')->name('blog.index');
    Route::post('/blog','App\Http\Controllers\BlogController@store')->name('blog.store');
    Route::get('/blog/create','App\Http\Controllers\BlogController@create')->name('blog.create');
    Route::put('/blog/{blog}','App\Http\Controllers\BlogController@update')->name('blog.update');
    Route::delete('/blog/{blog}','App\Http\Controllers\BlogController@destroy')->name('blog.destroy');
    Route::get('/blog/{blog}/edit','App\Http\Controllers\BlogController@edit')->name('blog.edit');

    //NEWS routes
    // Route::resource('news', 'App\Http\Controllers\NewsController');
    Route::get('/news','App\Http\Controllers\NewsController@index')->name('news.index');
    Route::post('/news','App\Http\Controllers\NewsController@store')->name('news.store');
    Route::get('/news/create','App\Http\Controllers\NewsController@create')->name('news.create');
    Route::put('/news/{news}','App\Http\Controllers\NewsController@update')->name('news.update');
    Route::delete('/news/{news}','App\Http\Controllers\NewsController@destroy')->name('news.destroy');
    Route::get('/news/{news}/edit','App\Http\Controllers\NewsController@edit')->name('news.edit');
});
