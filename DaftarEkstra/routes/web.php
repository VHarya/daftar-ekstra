<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', [\App\Http\Controllers\UserController::class, "login"]);
Route::get('/logout', [\App\Http\Controllers\UserController::class, "logout"]);

Route::get('/user', [\App\Http\Controllers\UserController::class, "index"]);
Route::get('/user/create', [\App\Http\Controllers\UserController::class, "create"]);
Route::get('/user/edit/{id?}', [\App\Http\Controllers\UserController::class, "edit"]);
Route::get('/user/update/{id?}', [\App\Http\Controllers\UserController::class, "update"]);
Route::get('/user/delete/{id?}', [\App\Http\Controllers\UserController::class, "delete"]);

Route::get('/siswa', [\App\Http\Controllers\SiswaController::class, "index"]);
Route::get('/siswa/edit/{id?}', [\App\Http\Controllers\SiswaController::class, "edit"]);
Route::get('/siswa/update/{id?}', [\App\Http\Controllers\SiswaController::class, "update"]);

Route::get('/pembimbing', [\App\Http\Controllers\PembimbingController::class, "index"]);
Route::get('/pembimbing/edit/{id?}', [\App\Http\Controllers\PembimbingController::class, "edit"]);
Route::get('/pembimbing/update/{id?}', [\App\Http\Controllers\PembimbingController::class, "update"]);


Route::get('/ekstra', [\App\Http\Controllers\EkstraController::class, "index"]);
Route::get('/ekstra/create', [\App\Http\Controllers\EkstraController::class, "create"]);
Route::get('/ekstra/edit/{id?}', [\App\Http\Controllers\EkstraController::class, "edit"]);
Route::get('/ekstra/update/{id?}', [\App\Http\Controllers\EkstraController::class, "update"]);
Route::get('/ekstra/delete/{id?}', [\App\Http\Controllers\EkstraController::class, "delete"]);


Route::get('/nilai', [\App\Http\Controllers\NilaiController::class, "index"]);
Route::get('/nilai/create', [\App\Http\Controllers\NilaiController::class, "create"]);
Route::get('/nilai/edit/{id?}', [\App\Http\Controllers\NilaiController::class, "edit"]);
Route::get('/nilai/update/{id?}', [\App\Http\Controllers\NilaiController::class, "update"]);
Route::get('/nilai/delete/{id?}', [\App\Http\Controllers\NilaiController::class, "delete"]);


Route::get('/anggota', [\App\Http\Controllers\AnggotaController::class, "index"]);
Route::get('/anggota/create', [\App\Http\Controllers\AnggotaController::class, "create"]);
Route::get('/anggota/edit/{id?}', [\App\Http\Controllers\AnggotaController::class, "edit"]);
Route::get('/anggota/update/{id?}', [\App\Http\Controllers\AnggotaController::class, "update"]);
Route::get('/anggota/delete/{id?}', [\App\Http\Controllers\AnggotaController::class, "delete"]);
