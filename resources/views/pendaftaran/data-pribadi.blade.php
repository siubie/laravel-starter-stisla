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
                            <li class="nav-item"><a href="#" class="nav-link">1. Buat Akun</a></li>
                            <li class="nav-item"><a href="#" class="nav-link active">2. Data Pribadi</a></li>
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
                            <h4>Data Pribadi</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group row align-items-center">
                                <label for="namalengkap" class="form-control-label col-sm-3 text-md-right">Nama Lengkap</label>
                                <div class="col-sm-6 col-md-9">
                                    <input type="text" required name="" class="form-control" id="namalengkap" placeholder="Isikan sesuai KTP">
                                </div>
                            </div>
                            <div class="form-group row align-items-center">
                                <label for="nik" class="form-control-label col-sm-3 text-md-right">Nomor Induk Kependudukan</label>
                                <div class="col-sm-6 col-md-9">
                                    <input type="number" required name="" class="form-control" id="nik" placeholder="NIK 16 digit sesuai yang ada di KTP/KK">
                                </div>
                            </div>
                            <div class="form-group row align-items-center">
                                <label class="form-control-label col-sm-3 text-md-right">Jenis Kelamin</label>
                                <div class="col-sm-6 col-md-9">
                                    <select class="form-control">
                                        <option value="1">Laki-Laki</option>
                                        <option value="2">Perempuan</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row align-items-center">
                                <label for="tempat-lahir" class="form-control-label col-sm-3 text-md-right">Tempat Lahir</label>
                                <div class="col-sm-6 col-md-9">
                                    <input type="text" required name="" class="form-control" id="tempat-lahir" placeholder="Kab/Kota Tempat Lahir">
                                </div>
                            </div>
                            <div class="form-group row align-items-center">
                                <label for="tanggal-lahir" class="form-control-label col-sm-3 text-md-right">Tanggal Lahir</label>
                                <div class="col-sm-6 col-md-9">
                                    <input type="date" required name="" class="form-control" id="tanggal-lahir">
                                </div>
                            </div>
                            <div class="form-group row align-items-center">
                                <label for="email" class="form-control-label col-sm-3 text-md-right">Alamat Email</label>
                                <div class="col-sm-6 col-md-9">
                                    <input type="email" required name="" class="form-control" id="email">
                                </div>
                            </div>
                            <div class="form-group row align-items-center">
                                <label for="password" class="form-control-label col-sm-3 text-md-right">Nomor Handphone</label>
                                <div class="col-sm-6 col-md-9">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <i class="fas fa-phone"></i>
                                            </div>
                                        </div>
                                        <input type="number" required name="" class="form-control phone-number">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer bg-whitesmoke text-md-right">
                            <button class="btn btn-secondary" type="reset">Reset</button>
                            <a class="btn btn-secondary" href="{{ url('pendaftaran/') }}">Kembali ke step sebelumnya?</a>
                            <a class="btn btn-primary" href="{{ url('pendaftaran/pilihan-prodi') }}">Simpan dan Lanjutkan</a>
                            {{-- <button class="btn btn-primary" id="save-btn">Save Changes</button> --}}
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
@endsection
