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
    Route::post('all-collections', 'CollectionsController@getAllCollections');
    Route::post('collections/collection-report', 'CollectionsController@getCollectionForReport');
    Route::post('collections/import', 'CollectionsController@importCollection');
    Route::post('collections/{id}/change-status', 'CollectionsController@changeCollectionStatus');
    Route::post('collections/delete/{id}', 'CollectionsController@destroy');
    Route::post('collections/collectionsprinttasks', 'CollectionsController@getCollectionSprintTasks');
    Route::put('collections/notes/{id}', 'CollectionsController@collectionNotesUpdate');
    Route::get('collections/collectionmembers', 'CollectionsController@getCollectionMembers');
    Route::get('collections/{id}/permission', 'CollectionsController@getCollectionPermission');
    Route::get('collections/my', 'CollectionsController@getMyCollections');
    Route::get('collections/get-template', 'CollectionsController@getTemplate');
    Route::get('collections/get-by-id/{id}', 'CollectionsController@show');
    Route::delete('collections/destroy/{id}', 'CollectionsController@destroy');
    Route::resource('collections', 'CollectionsController', ['except' => ['destroy']]);
});
