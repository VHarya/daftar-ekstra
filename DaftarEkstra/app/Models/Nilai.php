<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Nilai extends Model
{
    protected $table = 'nilai_siswas';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = ['id_siswa', 'id_ekstra', 'nilai'];
}
