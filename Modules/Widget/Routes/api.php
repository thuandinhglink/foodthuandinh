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
	    Route::post('all-widgets', 'WidgetController@getAllWidgets');
	    Route::get('widgets/getusedata', 'WidgetController@getUseData');
	    Route::get('widgets/{id}', 'WidgetController@getById');
	    Route::put(
		    'widgets/{id}', 'WidgetController@update'
	    );
	    Route::delete(
		    'widgets/{id}', 'WidgetController@delete'
	    );
	    Route::resource('widgets', 'WidgetController');
    }
);
