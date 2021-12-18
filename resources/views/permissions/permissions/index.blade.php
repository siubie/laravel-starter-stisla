@extends('layouts.app')

@section('content')
<section class="section">
    <div class="section-header">
        <h1>Roles and Permission</h1>
        <div class="section-header-breadcrumb">
            <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
            <div class="breadcrumb-item"><a href="#">Components</a></div>
            <div class="breadcrumb-item">Table</div>
        </div>
    </div>
    <div class="section-body">
        <h2 class="section-title">Permission</h2>

        <div class="row">
            <div class="col-12">
                @include('layouts.alert')
            </div>
        </div>
        <div class="row">
            
        </div>
    </div>
</section>
@endsection
@push('customScript')
@endpush
@push('customStyle')
@endpush