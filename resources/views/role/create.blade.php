@extends('layouts.app')

@section('content')

<section class="section">
    <div class="section-header">
        <h1>Table</h1>
        <div class="section-header-breadcrumb">
            <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
            <div class="breadcrumb-item"><a href="#">Components</a></div>
            <div class="breadcrumb-item">Table</div>
        </div>
    </div>
    <div class="section-body">
        <h2 class="section-title">Tambah Role dan Permission</h2>

        <div class="card">
            <form action="{{ route('role.store') }}" method="post">
                <div class="card-header">
                    <h4>Validasi Tambah Data</h4>
                </div>
                <div class="card-body">
                    @csrf
                    <div class="form-group">
                        <label for="level">Level</label>
                        <input type="text" class="form-control " id="level" name="level" placeholder="Enter User Level">   
                    </div>
                </div>
                <div class="card-footer text-right">
                    <button class="btn btn-primary">Submit</button>
                    <a class="btn btn-secondary" href="{{ route('user.index') }}">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</section>
@endsection