<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Productos_traducciones extends Model
{
    use HasFactory;
    protected $table='productos_traducciones';
    protected $fillable=['id','producto_id','nombre','descripcion_corta','descripcion_larga','url','idioma'];
}
