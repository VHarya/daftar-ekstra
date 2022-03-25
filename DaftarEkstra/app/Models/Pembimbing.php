<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pembimbing extends Model
{
    protected $table = 'pembimbings';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = ['id_user', 'telp', 'alamat'];
}
