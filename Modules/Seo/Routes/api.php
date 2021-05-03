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
	    Route::post('all-seo', 'SeoController@getAllSeo');
	    Route::get('get-all-seo', 'SeoController@getAll');
	    Route::get('get-all-keyword', 'SeoController@getAllKeyword');
	    Route::get('seo/{id}', 'SeoController@getById');
	    Route::put('seo/{id}', 'SeoController@update');
	    Route::delete('seo/{id}', 'SeoController@delete');
	    Route::resource('seo', 'SeoController');
    }
);
