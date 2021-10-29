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
        <h2 class="section-title">Manajemen User</h2>

        <div class="row">
            <div class="col-12">
                @include('layouts.alert')
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card card-primary">
                    <div class="card-header">
                        <h4>Daftar User</h4>
                        <div class="card-header-action">
                            <a class="btn btn-icon icon-left btn-primary" href="{{ route('user.create') }}">
                                <i class="fa fa-users" aria-hidden="true"></i>
                                Create New User</a>
                            <a class="btn btn-info btn-primary active click">
                                <i class="fa fa-download" aria-hidden="true"></i>
                                Import data</a>
                            <a class="btn btn-info btn-primary active" href="{{ route('user.export') }}">
                                <i class="fa fa-upload" aria-hidden="true"></i>
                                Export data</a>
                            <a class="btn btn-info btn-primary active click1">
                                <i class="fa fa-search" aria-hidden="true"></i>
                                Search data</a>
                        </div>
                    </div>
                    <div class="card-body showup">
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
                    <div class="card-body showup1">
                        <form id="search">
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="inputEmail4">Email</label>
                                    <input type="text" name="email" class="form-control" id="email" placeholder="Email">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputPassword4">Username</label>
                                    <input type="text" name="name" class="form-control" id="name" placeholder="name">
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
                    <div class="card-body">
                        <div class="col-lg-12">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered" id="datatable" data-url="{{ route('user.filter') }}" data-destroy="{{ url('user') }}">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Created At</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
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
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.11.3/datatables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
    $(document).ready(function() {
        //datatable
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        let datatable = $('#datatable').DataTable({
            responsive: true,
            pageLength: 10,
            searching: false,
            processing: true,
            serverSide: true,
            ajax: {
                url: $("#datatable").data('url'),
                type: "POST",
                data: function(d) {
                    d.name = $("#name").val();
                    d.email = $("#email").val();
                    d.level = $("#level").val();
                }
            },
            columnDefs: [{
                "defaultContent": "-",
                "targets": "_all"
            }],
            columns: [{
                    data: 'name',
                    width: '20%'
                },
                {
                    data: 'email',
                    width: '20%'
                },
                {
                    data: 'date',
                    width: '20%'
                },
                {
                    data: 'null',
                    name: 'action',
                    sortable: false,
                    width: '20%',
                    render: function(data, type, row, meta) {
                        if (type === 'display') {
                            return '<a href="user/' + row.id +
                                '/edit" class="btn btn-icon btn-sm btn-primary mr-2"><i class="fas fa-pencil-alt" title="Edit"></i></a>' +
                                '<a class=" btn btn-sm btn-danger deleteButton" href="#" data-toggle="tooltip" data-id="' +
                                row.id +
                                '" title="Delete"><i class="fas fa-trash"></i></a>' +
                                '</form>'
                        }
                        return '-'
                    }
                },
            ]
        });
        // delete
        $('#datatable').on("click", ".deleteButton", function(e) {
            e.preventDefault();
            let urlDelete = $('#datatable').data('destroy');
            let id = $(this).data('id');
            swal({
                    title: 'Are you sure want to delete this user?',
                    text: 'Once deleted, you will not be able to recover this user!',
                    icon: 'warning',
                    buttons: true,
                    dangerMode: true,
                })
                .then(function(result) {
                    if (result) {
                        e.preventDefault();
                        $.ajax({
                            url: urlDelete + "/" + id,
                            type: 'DELETE',
                            data: {
                                "id": id,
                            },
                            success: function(e) {
                                datatable.draw();
                                swal('Poof! User has been deleted!', {
                                    icon: 'success',
                                });
                            },
                        });
                    }
                });
        });
        //select2
        $('.select2').select2({});
        $('#search').on('submit', function(e) {
            e.preventDefault();
            datatable.draw();
        });
        $("#btnReset").click(function() {
            $(".select2").val('').trigger('change');
            $('#search').trigger("reset");
            datatable.draw();
        });
        //show hide toggle
        $(".showup").hide();
        $(".showup1").hide();
        $('.click').click(function(event) {
            event.stopPropagation();
            $(".showup").slideToggle("fast");
            $(".showup1").hide();
        });
        $(".showup").on("click", function(event) {
            event.stopPropagation();
        });

        $('.click1').click(function(event) {
            event.stopPropagation();
            $(".showup1").slideToggle("fast");
            $(".showup").hide();
        });
        $(".showup1").on("click1", function(event) {
            event.stopPropagation();
        });

        $(document).on("click", function() {
        $(".showup").hide();
    });

    $(document).on("click1", function() {
        $(".showup1").hide();
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
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.11.3/datatables.min.css" />

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
@endpush