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
	    Route::post('all-regions', 'RegionController@getAllRegions');
	    Route::get('regions/{id}', 'RegionController@getById');
	    Route::put(
		    'regions/{id}', 'RegionController@update'
	    );
	    Route::delete(
		    'regions/{id}', 'RegionController@delete'
	    );
	    Route::resource('regions', 'RegionController');
    }
);
