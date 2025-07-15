@extends('layouts.admin')

@section('content')
    @include('admin.components.cards')
    <div class="row mt-4">
        <div class="col-md-8">
            @include('admin.components.actividad')
        </div>
        <div class="col-md-4">
            @include('admin.components.precios')
        </div>
    </div>
@endsection
