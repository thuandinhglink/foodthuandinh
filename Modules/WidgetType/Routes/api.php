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
	    Route::post('all-widget-types', 'WidgetTypeController@getAllWidgetTypes');
	    Route::post('all-manager-widgets-types', 'WidgetTypeController@getAllManagerWidgets');
	    Route::post('widget-types/add-field-in-widget', 'WidgetTypeController@addField');
	    Route::get('all-fields', 'WidgetTypeController@getAllFields');
	    Route::get('widget-types/{id}', 'WidgetTypeController@getById');
	    Route::get('widget-types-field/{id}', 'WidgetTypeController@getFieldById');
	    Route::put('widget-types-field/{id}', 'WidgetTypeController@updateFieldInWidget');
	    Route::put(
		    'widget-types/{id}', 'WidgetTypeController@update'
	    );
	    Route::delete(
		    'widget-types/{id}', 'WidgetTypeController@delete'
	    );
	    Route::delete('widget-types-field/{id}', 'WidgetTypeController@deleteManagerWidget');
	    Route::resource('widget-types', 'WidgetTypeController');
    }
);
