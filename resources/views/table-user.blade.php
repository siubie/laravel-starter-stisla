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
        <div class="col-12 ">
          <div class="row">
            <div class="col-lg-12 margin-tb">

              <div class="pull-right mb-2">
                <a class="btn btn-success" onClick="add()" href="javascript:void(0)"> Create New Usery</a>
              </div>
            </div>
          </div>
          @if ($message = Session::get('success'))
          <div class="alert alert-success">
            <p>{{ $message }}</p>
          </div>
          @endif
          <div class="card">
            <div class="card-header">
              <h4>Table User</h4>
            </div>
            <div class="card-body p-0">
              <div class="table-responsive">
                <div class="container">
                  <table id="myTable" class="table table-stripped">
                    <thead>
                      <th>#</th>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Status</th>
                      <th>Action</th>
                    </thead>
                    <tbody>
                      @foreach($users as $user)
                      <tr>
                        <td>{{ $user->id}}</td>
                        <td>{{ $user->name}}</td>
                        <td>{{ $user->email}}</td>
                        <td>
                          <div class="badge badge-success">Active</div>
                        </td>
                        <td>
                          <a class="btn btn-primary btn-action mr-1" data-toggle="tooltip" title="Edit" href="javascript:void(0)" onclick="editFunc('{{ $user->id }}')"><i class="fas fa-pencil-alt"></i></a>
                          <a class="btn btn-danger btn-action" data-toggle="tooltip" title="Delete" data-><i class="fas fa-trash"></i></a>
                        </td>
                      </tr>
                      @endforeach
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>

<!-- Create new User -->
<div class="modal fade" id="user-modal" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="UserModal"></h4>
        <button type="button" class="close modelClose" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
        <form action="javascript:void(0)" id="UserForm" name="UserForm" class="form-horizontal" method="POST" enctype="multipart/form-data">
          @csrf
          <input type="hidden" name="id" id="id">
          <div class="form-group">
            <label for="name" class="col-sm-2 control-label">User Name</label>
            <div class="col-sm-12">
              <input type="text" class="form-control" id="name" name="name" placeholder="Enter User Name" maxlength="50" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="name" class="col-sm-2 control-label">User Email</label>
            <div class="col-sm-12">
              <input type="email" class="form-control" id="email" name="email" placeholder="Enter User Email" maxlength="50" required="">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">User Password</label>
            <div class="col-sm-12">
              <input type="text" class="form-control" id="password" name="password" placeholder="Enter Password" required="">
            </div>
          </div>
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-primary" id="btn-save">Save changes
            </button>
          </div>
        </form>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>

<!-- Edit User -->
<div class="modal fade" id="user-edit" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="UserEdit"></h4>
        <button type="button" class="close modelClose" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
        <form action="javascript:void(0)" id="UserForm" name="UserForm" class="form-horizontal" method="GET" enctype="multipart/form-data">
          @csrf
          <input type="hidden" name="id" id="id">
          <div class="form-group">
            <label for="name" class="col-sm-2 control-label">User Name</label>
            <div class="col-sm-12">
              <input type="text" class="form-control" id="name" name="name" placeholder="Enter User Name" maxlength="50" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="name" class="col-sm-2 control-label">User Email</label>
            <div class="col-sm-12">
              <input type="email" class="form-control" id="email" name="email" placeholder="Enter User Email" maxlength="50" required="">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">User Password</label>
            <div class="col-sm-12">
              <input type="text" class="form-control" id="password" name="password" placeholder="Enter Password" required="">
            </div>
          </div>
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-primary" id="btn-save">Save changes
            </button>
          </div>
        </form>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>

<!-- Delete User -->
<div class="modal" id="DeleteArticleModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">User Delete</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <h4>Are you sure want to delete this User?</h4>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" id="SubmitDeleteArticleForm">Yes</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
            </div>
        </div>
    </div>
</div>
@endsection