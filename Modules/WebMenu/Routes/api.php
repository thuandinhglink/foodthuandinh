<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::group(
    ['middleware' => 'auth:api'],
    function () {
	    Route::post('all-web-menu', 'WebMenuController@getAllMenu');
	    Route::get('web-menu/{id}', 'WebMenuController@getById');
	    Route::get('get-data-sub-menu', 'WebMenuController@getDataSubMenu');
	    Route::put('web-menu/{id}', 'WebMenuController@update');
	    Route::delete('web-menu/{id}', 'WebMenuController@delete');
	    Route::resource('web-menu', 'WebMenuController');
	    Route::post('all-web-sub-menu', 'WebMenuController@getAllSubMenu');
	    Route::post('add-web-sub-menu', 'WebMenuController@addSubMenu');
	    Route::put('web-sub-menu/{id}', 'WebMenuController@updateSubMenu');
	    Route::delete('web-sub-menu/{id}', 'WebMenuController@deleteSubMenu');
    }
);
