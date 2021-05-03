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
	    Route::post('all-templates', 'TemplateController@getAllTemplates');
	    Route::post('all-manager-regions', 'TemplateController@getAllManagerRegions');
	    Route::post('templates/manager-regions', 'TemplateController@addRegion');
	    Route::get('templates/{id}', 'TemplateController@getById');
	    Route::get('templates-region/{id}', 'TemplateController@getRegionById');
	    Route::put('templates/{id}', 'TemplateController@update');
	    Route::post('manager-regions-change-status/{id}', 'TemplateController@changeStatus' );
	    Route::put('manager-regions/{id}', 'TemplateController@updateManagerRegion');
	    Route::delete('templates/{id}', 'TemplateController@delete');
	    Route::delete('manager-region/{id}', 'TemplateController@deleteManagerRegion');
	    Route::resource('templates', 'TemplateController');
    }
);
