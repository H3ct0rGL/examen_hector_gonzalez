<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Productos;
use App\Models\Productos_traducciones;

class ProductosController extends Controller
{

    public function index()
    {
        $productos = Productos::orderBy('id','desc')->paginate(5);
        return view('productos.index', compact('productos'));
    }

    public function create()
    {
        return view('productos.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'sku' => ['required', 'unique:productos'],
            'precioPesos' => ['required', 'numeric', 'min:1'],
            'puntos' => ['required', 'numeric', 'min:1'],
            'nombre' => ['required', 'max:70', 'regex:/^[a-zA-Z\s]+$/u'],
            'descripcion_corta' => ['required', 'max:120'],
            'nombre_ingles' => ['required', 'max:70', 'regex:/^[a-zA-Z\s]+$/u'],
            'descripcion_corta_ingles' => ['required', 'max:120'],
        ]);
        /*
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://www.banxico.org.mx/SieAPIRest/service/v1/series/SF43718/datos?token=4b0e2214537bc1d13041d712903d3921de1e56fb74863d9d11bff009d9d6ac30");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $restBanxico = curl_exec($ch);
        //print_r($restBanxico);
        */
        //$tipoCambio = new TipoCambioController();
        //$valorDolar = $tipoCambio->tipoCambio();
        $valorDolar = 17.2840;
        $precioDolares = request('precioPesos')/$valorDolar;

        $url_guiones = strtr(request('nombre')," ","-");
        $url_min = strtolower($url_guiones);
        $url_final = $url_min.'-'.request('sku');

        $url_guiones_ingles = strtr(request('nombre_ingles')," ","-");
        $url_min_ingles = strtolower($url_guiones_ingles);
        $url_final_ingles = $url_min_ingles.'-'.request('sku');

        $producto=Productos::create([
            'sku' => request('sku'),
            'precioDolares' => $precioDolares,
            'precioPesos' => request('precioPesos'),
            'puntos' => request('puntos'),
            'url' => $url_final,
            'activo' => 0
        ]);

        Productos_traducciones::create([
            'producto_id' => $producto->id,
            'nombre' => request('nombre'),
            'descripcion_corta' => request('descripcion_corta'),
            'descripcion_larga' => request('descripcion_larga'),
            'url' => $url_final,
            'idioma' => 'espanol'
        ]);

        Productos_traducciones::create([
            'producto_id' => $producto->id,
            'nombre' => request('nombre_ingles'),
            'descripcion_corta' => request('descripcion_corta_ingles'),
            'descripcion_larga' => request('descripcion_larga_ingles'),
            'url' => $url_final_ingles,
            'idioma' => 'ingles'
        ]);

        return redirect()->route('productos.index')->with('Excelente','Producto ha sido creado con éxito.');
    }

    /*
    public function show(Productos $producto)
    {
        return view('productos.show',compact('producto'));
    }
    public function edit(Productos $producto)
    {
        return view('productos.edit',compact('producto'));
    }
    public function update(Request $request, Productos $producto)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'address' => 'required',
        ]);
        $producto->fill($request->post())->save();
        return redirect()->route('productos.index')->with('success','Company Has Been updated successfully');
    }
    public function destroy(Productos $producto)
    {
        $producto->delete();
        return redirect()->route('productos.index')->with('success','Company has been deleted successfully');
    }
    */
}
