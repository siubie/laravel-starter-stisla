@extends('layouts.app')

@section('content')
    <!-- Main Content -->
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
            <h2 class="section-title">Role And Permission</h2>

            <div class="row">
                <div class="col-12">
                    @include('layouts.alert')
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h4>Roles List</h4>
                            <div class="card-header-action">
                                <a class="btn btn-icon icon-left btn-primary" href="{{ route('user.create') }}">Create New
                                    Role</a>
                                <a class="btn btn-info btn-primary active import">
                                    <i class="fa fa-download" aria-hidden="true"></i>
                                    Import Role</a>
                                <a class="btn btn-info btn-primary active" href="{{ route('user.export') }}">
                                    <i class="fa fa-upload" aria-hidden="true"></i>
                                    Export Role</a>
                                <a class="btn btn-info btn-primary active search">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                    Search Role</a>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="show-import" style="display: none">
                                <div class="custom-file">
                                    <form action="{{ route('user.import') }}" method="post" enctype="multipart/form-data">
                                        {{ csrf_field() }}
                                        <label class="custom-file-label" for="file-upload">Choose File</label>
                                        <input type="file" id="file-upload" class="custom-file-input" name="import_file">
                                        <br /> <br />
                                        <div class="footer text-right">
                                            <button class="btn btn-primary">Import File</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="show-search" style="display: none">
                                <form id="search">
                                    <div class="form-row">
                                        <div class="form-group col-md-4">
                                            <label for="inputEmail4">Email</label>
                                            <input type="text" name="email" class="form-control" id="email"
                                                placeholder="Email">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="inputPassword4">Username</label>
                                            <input type="text" name="name" class="form-control" id="name"
                                                placeholder="name">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="level">Level</label>
                                            <select id="level" class="form-control select2">
                                                <option value="" selected>Pilih Salah Satu</option>
                                                <option value="admin">Admin</option>
                                                <option value="user">User</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <button class="btn btn-primary mr-1" type="submit">Submit</button>
                                        <button class="btn btn-secondary" type="reset" id="btnReset">Reset</button>
                                    </div>
                                </form>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered table-md">
                                    <tbody>
                                        <tr>
                                            <th>#</th>
                                            <th>Name</th>
                                            <th class="text-right">Action</th>
                                        </tr>
                                        @foreach ($roles as $key => $role)
                                            <tr>
                                                <td>{{ ($roles->currentPage()-1) * $roles->perPage() + $key +1}}</td>
                                                <td>{{ $role->name }}</td>
                                                <td class="text-right">
                                                    <a href="#" class="btn btn-sm btn-info btn-icon "><i
                                                            class="fas fa-edit"></i>
                                                        Edit</a>
                                                    <a href="#" class="btn btn-sm btn-danger btn-icon "><i
                                                            class="fas fa-times"></i>
                                                        Delete</a>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-center">
                                    {{ $roles->links() }}
                                </div>
                            </div>
                        </div>




                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
@push('customScript')
    <script>
        $(document).ready(function() {
            $('.import').click(function(event) {
                event.stopPropagation();
                $(".show-import").slideToggle("fast");
                $(".show-search").hide();
            });
            $('.search').click(function(event) {
                event.stopPropagation();
                $(".show-search").slideToggle("fast");
                $(".show-import").hide();
            });
            //ganti label berdasarkan nama file
            $('#file-upload').change(function() {
                var i = $(this).prev('label').clone();
                var file = $('#file-upload')[0].files[0].name;
                $(this).prev('label').text(file);
            });
        });
    </script>
@endpush

@push('customStyle')
@endpush
