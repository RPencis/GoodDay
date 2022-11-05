<?php

use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;

Route::group([
    'namespace'  => 'App\Http\Controllers\Admin',
    'prefix'     => 'admin',
    'middleware' => ['auth'],
], function () {
    // Route::resource generates only the basic CRUD actions
    // Route::resource('permission', 'PermissionController');
    Route::resource('role', 'RolesController');
    //any other route has to be documented separately
    Route::get('/role/{role}/permissions','RolesController@permissions')->name('role.permissions');
    Route::put('/role/{role}/permissionsStore','RolesController@permissionsStore')->name('role.permissionsStore');
});
