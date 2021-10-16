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
      <h2 class="section-title">Table</h2>
      <p class="section-lead">Example of some Bootstrap table components.</p>
      <div class="row">
        <div class="col-12 ">
          <div class="card">
            <div class="card-header">
              <h4>Table User</h4>
            </div>
            <div class="card-body p-0">
              <div class="table-responsive">
                <div class="container">
                  <table id="myTable" class="table table-stripped">
                  <!-- <a class="btn btn-primary btn-action mr-1" data-toggle="tooltip" title="Add" href="/add-user}}"><i class="fas fa-add-alt"></i></a> -->
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
                          <a class="btn btn-primary btn-action mr-1" data-toggle="tooltip" title="Edit" href="/update-user/{{ $user->id }}"><i class="fas fa-pencil-alt"></i></a>
                          <a class="btn btn-danger btn-action" data-toggle="tooltip" title="Delete" data-confirm="Are You Sure?|This action can not be undone. Do you want to continue?" data-confirm-yes="alert('Deleted')"><i class="fas fa-trash"></i></a>
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
@endsection