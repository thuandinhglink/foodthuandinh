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
	    Route::post('all-pages', 'PageController@getAllPages');
	    Route::post('all-manager-widgets', 'PageController@getAllManagerWidgets');
	    Route::post('pages/manager-widgets', 'PageController@addWidget');
	    Route::get('pages/{id}', 'PageController@getById');
	    Route::get('clonePage/{id}', 'PageController@clonePage');
	    Route::get('pages-widget/{id}', 'PageController@getWidgetById');
	    Route::put('manager-widgets/{id}', 'PageController@updateManagerWidget');
	    Route::put(
		    'pages/{id}', 'PageController@update'
	    );
	    Route::delete(
		    'pages/{id}', 'PageController@delete'
	    );
	    Route::post('manager-widget-change-status/{id}', 'PageController@changeStatus' );
	    Route::delete('manager-widget/{id}', 'PageController@deleteManagerWidget');
	    Route::resource('pages', 'PageController');
    }
);
