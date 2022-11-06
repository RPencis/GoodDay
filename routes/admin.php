<?php

use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;

Route::group([
    'namespace'  => 'App\Http\Controllers\Admin',
    'prefix'     => 'admin',
    'middleware' => ['auth'],
], function () {
    // Route::resource generates only the basic CRUD actions
    Route::resource('role', 'RolesController');
    
    Route::get('/user-roles', 'UserRolesAdminController@index')->name('user-roles.index');
    Route::get('/user-roles/{user}/edit', 'UserRolesAdminController@edit')->name('user-roles.edit');
    Route::get('/user-roles/{user}', 'UserRolesAdminController@show')->name('user-roles.show');
    Route::put('/user-roles/{user}', 'UserRolesAdminController@update')->name('user-roles.update');
    
    //any other route has to be documented separately
    Route::get('/role/{role}/permissions','RolesController@permissions')->name('role.permissions');
    Route::put('/role/{role}/permissionsStore','RolesController@permissionsStore')->name('role.permissionsStore');
});
