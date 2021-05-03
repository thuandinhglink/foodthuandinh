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
	    Route::post('all-themes', 'ThemeController@getAllThemes');
	    Route::post('themes-import', 'ThemeController@ImportTheme');
	    Route::get('themes/{id}', 'ThemeController@getById');
	    Route::put(
		    'themes/{id}', 'ThemeController@update'
	    );
	    Route::delete(
		    'themes/{id}', 'ThemeController@delete'
	    );
	    Route::post(
		    'themes/{id}/change-status',
		    'ThemeController@changeThemeStatus'
	    );
	    Route::resource('themes', 'ThemeController');
    }
);
