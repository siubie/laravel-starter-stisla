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
            <h2 class="section-title">DataTables</h2>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="col-lg-12 margin-tb">
                                <div class="pull-right mb-2">
                                    <a class="btn btn-success" href="{{ route('user.create') }}"> Create New User</a>
                                </div>
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
                                            <td>{{ $user->created_at }}</td>
                                            <td>
                                                <div class="badge badge-success">Active</div>
                                            </td>
                                            <td class="d-flex align-items-center">
                                                <a class="btn btn-primary btn-action mr-1" data-toggle="tooltip" title="Edit" href="{{route ('user.edit', $user)}}"><i class="fas fa-pencil-alt"></i></a>
                                                <form class="delete-user ml-2" action="{{route('user.destroy',$user)}}" method="POST">
                                                    @csrf
                                                    @method('DELETE')
                                                    <a class=" btn btn-danger btn-action swal-6" data-toggle="tooltip" data-id="{{ $user->id }}" title="Delete" onClick="return false"><i class="fas fa-trash"></i></a>
                                                </form>
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <a class="btn btn-success" href="{{ route('user.export') }}">Export data</a>
                            <br /> <br />
                            <form style="border: 4px solid #a1a1a1;margin-top: 15px;padding: 10px;" action="{{ route('user.import') }}" class="form-horizontal" method="post" enctype="multipart/form-data">
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