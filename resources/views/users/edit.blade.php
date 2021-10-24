@extends('layouts.app')
<!-- {{ URL::asset('css/style.css') }} -->

@section('content')
    <div class="section-body">
        <h2 class="section-title">Edit User</h2>
        <div class="card">
            <form action="{{ route('user.update', $user) }}" method="POST">
                <div class="card-header">
                    <h4>Validasi Edit Data User</h4>
                </div>
                <div class="card-body">
                    @csrf
                    @method('PUT')
                    <div class="form-group">
                        <label for="name">Your Name</label>
                        <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name"
                            value="{{ $user->name }}">
                        @error('name')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" class="form-control @error('email') is-invalid @enderror" id="email" name="email"
                            value="{{ $user->email }}">
                        @error('email')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>
                </div>
                <div class="card-footer text-right">
                    <button class="btn btn-primary">Submit</button>
                    <a class="btn btn-secondary" href="{{ route('user.index') }}">Cancel</a>
                </div>
            </form>
        </div>
    </div>
@endsection
