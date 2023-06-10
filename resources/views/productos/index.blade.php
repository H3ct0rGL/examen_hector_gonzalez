<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Administrar Productos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" >
</head>
<body>

<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Administrar Productos') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">

                <div class="container mt-2">
                    <div class="row">
                        <div class="col-lg-12 margin-tb">
                            <div class="pull-right mb-2">
                                <a class="btn btn-success" href="{{ route('productos.create') }}"> Nuevo Producto</a>
                            </div>
                        </div>
                    </div>
                    @if ($message = Session::get('success'))
                        <div class="alert alert-success">
                            <p>{{ $message }}</p>
                        </div>
                    @endif
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Sku</th>
                                <th>Precio Dolares</th>
                                <th>Precio Pesos</th>
                                <th>Puntos</th>
                                <th>Activo</th>
                                <th width="280px">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($productos as $producto)
                                <tr>
                                    <td>{{ $producto->sku }}</td>
                                    <td>{{ $producto->precioDolares }}</td>
                                    <td>{{ $producto->precioPesos }}</td>
                                    <td>{{ $producto->puntos }}</td>
                                    <td>{{ $producto->activo }}</td>
                                    <td>
                                        <a class="btn btn-success" href="{{ route('productos.show',$producto->id) }}">Detalle</a>
                                        <a class="btn btn-primary" href="{{ route('productos.edit',$producto->id) }}">Editar</a>
                                        <!--a class="btn btn-warning" href="">Desactivar</a-->
                                        <a class="btn btn-danger" href="{{ route('productos.destroy',$producto->id) }}">Eliminar</a>
                                        <!--form action="{{ route('productos.destroy',$producto->id) }}" method="Post">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-danger">Eliminar</button>
                                        </form-->
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    {!! $productos->links() !!}
                </div>

            </div>
        </div>
    </div>
</x-app-layout>

</body>
</html>
