@extends('layouts.app')

@section('content')

    <section class="section">
        <div class="section-header">
            <h1>Menu Group and Menu Item</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="#">Components</a></div>
                <div class="breadcrumb-item">Table</div>
            </div>
        </div>
        <div class="section-body">
            <h2 class="section-title">Menu Item Management</h2>

            <div class="card">
                <div class="card-header">
                    <h4>Menu Item Create Form</h4>
                </div>
                <div class="card-body">
                    <form action="{{ route('menu-item.store') }}" method="post">
                        @csrf
                        <div class="form-group">
                            <label>Parent</label>
                            <select class="form-control select2" name="menu_group_id">
                                <option value="">Choose Menu Group</option>
                                @foreach ($menuGroups as $item)
                                    <option value="{{ $item->id }}">{{ $item->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="name">Menu Item Name</label>
                            <input type="text" class="form-control @error('name') is-invalid @enderror" id="name"
                                name="name" placeholder="Menu Item Name" value="{{ old('name') }}">
                            @error('name')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label>Url</label>
                            <select class="form-control select2" name="url">
                                <option value="">Choose Url</option>
                                @foreach ($routeCollection as $item)
                                    <option value="{{ $item->uri() }}">{{ $item->uri() }}</option>
                                @endforeach
                            </select>
                        </div>

                </div>
                <div class="card-footer text-right">
                    <button class="btn btn-primary">Submit</button>
                    <a class="btn btn-secondary" href="{{ route('menu-item.index') }}">Cancel</a>
                </div>
                </form>
            </div>
        </div>
    </section>
@endsection

@push('customScript')
    <script src="/assets/js/select2.min.js"></script>
@endpush

@push('customStyle')
    <link rel="stylesheet" href="/assets/css/select2.min.css">
@endpush
