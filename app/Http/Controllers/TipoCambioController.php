<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\BanxicoAPI;

class TipoCambioController extends Controller
{

    public function tipoCambio() {
        $banxico = new BanxicoAPI();
        $results = $banxico->getDolarValue();
        $dollars_history = $results->bmx->series[0]->datos;
        foreach($dollars_history as $dollar){
            $tipo_cambio = $dollar->dato;
        }        
        return $tipo_cambio;
    }

}
