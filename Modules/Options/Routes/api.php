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

Route::group(['middleware' => 'auth:api'], function () {
    Route::post('all-options', 'OptionsController@getAllOptions');
    Route::post('options/{id}/change-status', 'OptionsController@changeOptionStatus');
    Route::post('options/delete/{id}', 'OptionsController@destroy');
    Route::post('options/getAll', 'OptionsController@findAll');
    Route::get('options/{id}/permission', 'OptionsController@getOptionPermission');
    Route::get('options/get-by-id/{id}', 'OptionsController@show');
    Route::delete('options/{id}', 'OptionsController@destroy');
    Route::put('options/{id}', 'OptionsController@update');
    Route::resource('options', 'OptionsController', ['except' => ['destroy']]);
});
