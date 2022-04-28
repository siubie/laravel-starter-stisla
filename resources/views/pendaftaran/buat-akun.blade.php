@extends('fe-layouts.app')
@section('content')
<section class="section">
    <div class="section-header">
        {{-- <div class="section-header-back">
            <a href="features-settings.html" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
        </div> --}}
        <h1>Formulir Pendaftaran</h1>
        {{-- <div class="section-header-breadcrumb">
            <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
            <div class="breadcrumb-item active"><a href="#">Settings</a></div>
            <div class="breadcrumb-item">General Settings</div>
        </div> --}}
    </div>

    <div class="section-body">
        <div id="output-status"></div>
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-header">
                        <h4>Step Pendaftaran</h4>
                    </div>
                    <div class="card-body">
                        <ul class="nav nav-pills flex-column">
                            <li class="nav-item"><a href="#" class="nav-link active">1. Buat Akun</a></li>
                            <li class="nav-item"><a href="#" class="nav-link">2. Data Pribadi</a></li>
                            <li class="nav-item"><a href="#" class="nav-link">3. Pilihan Program Studi</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <form id="setting-form">
                    @csrf
                    <div class="card" id="settings-card">
                        <div class="card-header">
                            <h4>Buat Akun</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group row align-items-center">
                                <label for="username" class="form-control-label col-sm-3 text-md-right">Username</label>
                                <div class="col-sm-6 col-md-9">
                                    <input type="text" required name="username" class="form-control" id="username" placeholder="Username untuk login">
                                    <div class="invalid-feedback">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row align-items-center">
                                <label for="password" class="form-control-label col-sm-3 text-md-right">Password</label>
                                <div class="col-sm-6 col-md-9">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <i class="fas fa-lock"></i>
                                            </div>
                                        </div>
                                        <input type="password" class="form-control" data-indicator="pwindicator" required name="password" id="password">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row align-items-center">
                                <label for="repeat-password" class="form-control-label col-sm-3 text-md-right">Ulangi Password</label>
                                <div class="col-sm-6 col-md-9">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <i class="fas fa-lock"></i>
                                            </div>
                                        </div>
                                        <input type="password" class="form-control" data-indicator="pwindicator" required name="repeat-password" id="repeat-password">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer bg-whitesmoke text-md-right">
                            <button class="btn btn-secondary" type="reset">Reset</button>
                            <a class="btn btn-primary" href="{{ url('pendaftaran/data-pribadi') }}">Simpan dan Lanjutkan</a>
                            {{-- <button class="btn btn-primary" id="save-btn">Save Changes</button> --}}
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
@endsection
