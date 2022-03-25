<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Anggota extends Model
{
    protected $table = 'anggota_ekstras';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = ['id_siswa', 'id_ekstra'];
}
