<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Siswa extends Model
{
    protected $table = 'siswas';
    protected $primaryKey = 'id';
    protected $fillable = ['id_user'];
    public $timestamps = false;
}
