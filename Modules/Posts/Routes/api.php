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
    Route::post('all-posts', 'PostsController@getAllPosts');
    Route::post('posts/post-report', 'PostsController@getPostForReport');
    Route::post('posts/import', 'PostsController@importPost');
    Route::post('posts/{id}/change-status', 'PostsController@changePostStatus');
    Route::post('posts/delete/{id}', 'PostsController@destroy');
    Route::post('posts/postsprinttasks', 'PostsController@getPostSprintTasks');
    Route::put('posts/notes/{id}', 'PostsController@PostNotesUpdate');
    Route::get('posts/Postmembers', 'PostsController@getPostMembers');
    Route::get('posts/{id}/permission', 'PostsController@getPostPermission');
    Route::get('posts/my', 'PostsController@getMyPosts');
    Route::get('posts/get-template', 'PostsController@getTemplate');
    Route::get('posts/get-by-id/{id}', 'PostsController@show');
    Route::delete('posts/destroy/{id}', 'PostsController@destroy');
    Route::resource('posts', 'PostsController', ['except' => ['destroy']]);
});
