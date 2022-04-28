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
                            <li class="nav-item"><a href="#" class="nav-link">2. Data Pribadi</a></li>
                            <li class="nav-item"><a href="#" class="nav-link active">3. Pilihan Program Studi</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <form id="setting-form">
                    @csrf
                    <div class="card" id="settings-card">
                        <div class="card-header">
                            <h4>Pilihan Program Studi</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group row align-items-center">
                                <label for="asal-sekolah" class="form-control-label col-sm-3 text-md-right">Asal Sekolah</label>
                                <div class="col-sm-6 col-md-9">
                                    <input type="text" required name="" class="form-control" id="asal-sekolah" placeholder="ex: SMKN 2 Kota Bekasi">
                                </div>
                            </div>
                            <div class="form-group row align-items-center">
                                <label for="tahun-lulus" class="form-control-label col-sm-3 text-md-right">Tahun Lulus</label>
                                <div class="col-sm-6 col-md-9">
                                    <input type="year" required name="" class="form-control" id="tahun-lulus" placeholder="ex: 2022">
                                </div>
                            </div>
                            <div class="form-group row align-items-center">
                                <label class="form-control-label col-sm-3 text-md-right">Pilihan Program Studi 1</label>
                                <div class="col-sm-6 col-md-9">
                                    <select class="form-control select2">
                                        <option>-- Pilih Prodi ---</option>
                                        <option value="1">Teknik Informatika</option>
                                        <option value="1">Teknik Telekomunikasi</option>
                                        <option value="1">Teknik Informasi</option>
                                        <option value="1">Teknik Logistik</option>
                                        <option value="1">Teknik Biomedis</option>
                                        <option value="2">Sistem Informasi</option>
                                        <option value="2">Sistem Komputer</option>
                                        <option value="2">Desain Komunikasi Visual</option>
                                        <option value="2">Desain Interior</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row align-items-center">
                                <label class="form-control-label col-sm-3 text-md-right">Pilihan Program Studi 2</label>
                                <div class="col-sm-6 col-md-9">
                                    <select class="form-control select2">
                                        <option>-- Pilih Prodi ---</option>
                                        <option value="1">Teknik Informatika</option>
                                        <option value="1">Teknik Telekomunikasi</option>
                                        <option value="1">Teknik Informasi</option>
                                        <option value="1">Teknik Logistik</option>
                                        <option value="1">Teknik Biomedis</option>
                                        <option value="2">Sistem Informasi</option>
                                        <option value="2">Sistem Komputer</option>
                                        <option value="2">Desain Komunikasi Visual</option>
                                        <option value="2">Desain Interior</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer bg-whitesmoke text-md-right">
                            <button class="btn btn-secondary" type="reset">Reset</button>
                            <a class="btn btn-secondary" href="{{ url('pendaftaran/data-pribadi') }}">Kembali ke step sebelumnya?</a>
                            <a class="btn btn-primary" href="{{ url('pendaftaran/finish') }}">Simpan dan Lanjutkan</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
@endsection

@push('customStyle')
    <link rel="stylesheet" href="/assets/css/select2.min.css">
@endpush

@push('customScript')
    <script src="/assets/js/select2.min.js"></script>
@endpush

