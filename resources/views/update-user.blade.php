@extends('layouts.app')
@section('content')
<!-- Main Content -->
<div class="main-content">
    <section class="section">
        <div class="section-header">
            <h1>Update User</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Forms</a></div>
                <div class="breadcrumb-item">Edit User</div>
            </div>
        </div>

        <div class="section-body">
            <div class="row">
                <div class="col-12 col-md-6 col-lg-6">
                    <div class="card">
                        <form class="needs-validation" novalidate="" method="POST">
                            <div class="card-header">
                                <h4>User</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="first_name">Full Name</label>
                                    <input id="first_name" type="text" name="name" value="" class="form-control @error('name') is-invalid @enderror" placeholder="Masukkan Nama Lengkap" autofocus>
                                    @error('name')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input id="email" type="email" class="form-control" name="email" value="" class="form-control @error('email') is-invalid @enderror" placeholder="Masukkan Alamat Email">
                                    @error('email')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="password" class="d-block">Password</label>
                                    <input id="password" type="password" name="password" value="" class="form-control @error('password') is-invalid @enderror" placeholder="Masukkan Password" data-indicator="pwindicator">
                                    @error('password')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                    @enderror
                                </div>
                                <div class="form-group mb-0">
                                    <label for="password2" class="d-block">Password Confirmation</label>
                                    <input id="password2" name="password_confirmation" class="form-control" placeholder="Masukkan Konfirmasi Password">
                                </div>
                            </div>
                            <div class="card-footer text-right">
                                <button class="btn btn-primary">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection