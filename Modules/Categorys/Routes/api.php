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
    Route::post('all-categorys', 'CategorysController@getAllCategorys');
    Route::post('categorys/category-report', 'CategorysController@getCategoryForReport');
    Route::post('categorys/import', 'CategorysController@importCategory');
    Route::post('categorys/{id}/change-status', 'CategorysController@changeCategoryStatus');
    Route::post('categorys/delete/{id}', 'CategorysController@destroy');
    Route::post('categorys/categorysprinttasks', 'CategorysController@getCategorySprintTasks');
    Route::put('categorys/notes/{id}', 'CategorysController@categoryNotesUpdate');
    Route::get('categorys/categorymembers', 'CategorysController@getCategoryMembers');
    Route::get('categorys/{id}/permission', 'CategorysController@getCategoryPermission');
    Route::get('categorys/my', 'CategorysController@getMyCategorys');
    Route::get('categorys/get-template', 'CategorysController@getTemplate');
    Route::get('categorys/get-by-id/{id}', 'CategorysController@show');
    Route::delete('categorys/destroy/{id}', 'CategorysController@destroy');
    Route::resource('categorys', 'CategorysController', ['except' => ['destroy']]);
});
