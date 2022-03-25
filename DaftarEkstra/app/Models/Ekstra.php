<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ekstra extends Model
{
    protected $table = 'ekstras';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = ['nama', 'deskripsi', 'kegiatan', 'id_pembimbing', 'icon'];
}
