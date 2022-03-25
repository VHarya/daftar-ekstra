<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/login/{username}/{password}', [\App\Http\Controllers\APIController::class, "login"]);
Route::get('/getSiswaData/{id}', [\App\Http\Controllers\APIController::class, "getSiswaData"]);
Route::get('/getNilaiSiswa/{id}', [\App\Http\Controllers\APIController::class, "getNilaiSiswa"]);
Route::get('/getAllEkstra', [\App\Http\Controllers\APIController::class, "getAllEkstra"]);
Route::get('/getEkstra/{id}', [\App\Http\Controllers\APIController::class, "getEkstra"]);
Route::post('/daftarEkstra', [\App\Http\Controllers\APIController::class, "daftarEkstra"]);
