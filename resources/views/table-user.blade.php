@extends('layouts.app')

@section('content')
    <!-- Main Content -->
    <div class="main-content">
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
                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h4>Daftar User</h4>
                                <div class="card-header-action">
                                    <a class="btn btn-icon icon-left btn-primary" href="{{ route('user.create') }}">
                                        <i class="fa fa-users" aria-hidden="true"></i>
                                        Create New User</a>
                                    <a class="btn btn-info" href="{{ route('user.export') }}">
                                        <i class="fa fa-download" aria-hidden="true"></i>
                                        Export data</a>
                                </div>
                            </div>

                            <div class="row">
                            </div>
                            @if ($message = Session::get('success'))
                                <div class="alert alert-success">
                                    <p>{{ $message }}</p>
                                </div>
                            @endif
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="myTable" class="table table-stripped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Created at</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($users as $user)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>{{ $user->name }}</td>
                                                    <td>{{ $user->email }}</td>
                                                    <td>{{ $user->created_at->format('d/m/Y') }}</td>
                                                    <td>
                                                        <div class="badge badge-success">Active</div>
                                                    </td>
                                                    <td class="d-flex align-items-center">
                                                        <a class="btn btn-icon btn-sm btn-primary mr-1"
                                                            data-toggle="tooltip" title="Edit"
                                                            href="{{ route('user.edit', $user) }}">
                                                            <i class="fas fa-pencil-alt"></i>
                                                        </a>
                                                        <form class="delete-user ml-2"
                                                            action="{{ route('user.destroy', $user) }}" method="POST">
                                                            @csrf
                                                            @method('DELETE')
                                                            <a class="btn btn-icon btn-sm btn-danger swal-6"
                                                                data-toggle="tooltip" data-id="{{ $user->id }}"
                                                                title="Delete" onClick="return false" href="#">
                                                                <i class="fas fa-trash"></i>
                                                            </a>
                                                        </form>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="customFile">
                                    <label class="custom-file-label" for="customFile">Choose file</label>
                                </div>
                                <form style="border: 4px solid #a1a1a1;margin-top: 15px;padding: 10px;"
                                    action="{{ route('user.import') }}" class="form-horizontal" method="post"
                                    enctype="multipart/form-data">
                                    {{ csrf_field() }}
                                    <input type="file" name="import_file" />
                                    <button class="btn btn-primary">Import File</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
