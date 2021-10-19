@extends('layouts.app')
<!-- {{ URL::asset('css/style.css'); }} -->

@section('content')
<div class="main-content">
    <section class="section">
        <div class="section-header">
            <h1>Form Validation User</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Forms</a></div>
                <div class="breadcrumb-item">Form Validation</div>
            </div>
        </div>

        <div class="section-body">
            <h2 class="section-title">Edit User</h2>

            <div class="card">
                <!-- <form action="{{ url('user.update') }}" method="post"> -->
                {{ Form::model($user, array('route' => array('user.update', $user->id), 'method' => 'PUT')) }}
                <div class="card-header">
                    <h4>Server-side Validation</h4>
                </div>
                <div class="card-body">

                   
                    <div class="form-group">
                        {{ Form::label('name', 'Name') }}
                        {{ Form::text('name', null, array('class' => 'form-control')) }}
                    </div>
                    <div class="form-group">
                        {{ Form::label('email', 'Email') }}
                        {{ Form::text('email', null, array('class' => 'form-control')) }}
                    </div>
                   
                </div>
                <div class="card-footer text-right">
                    <button class="btn btn-primary">Submit</button>
                </div>
                </form>

            </div>

        </div>
    </section>
</div>
@endsection