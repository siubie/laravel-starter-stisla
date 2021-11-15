<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('role.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $roles = Role::pluck('name','name')->all();
        return view('role.create',compact('roles'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $role = Role::create(['name' => $request['level']]);

        return redirect(route('role.index'))->with('success', 'Data Berhasil Ditambahkan');;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $role = Role::find($id);
        $permission = Permission::get();
        $rolePermissions = DB::table("role_has_permissions")->where("role_has_permissions.role_id",$id)
            ->pluck('role_has_permissions.permission_id','role_has_permissions.permission_id')
            ->all();
    
        return view('role.edit',compact('role','permission','rolePermissions'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required',
            'permission' => 'required',
        ]);
    
        $role = Role::find($id);
        $role->name = $request->input('name');
        $role->save();
    
        $role->syncPermissions($request->input('permission'));
    
        return redirect()->route('role.index')
                        ->with('success','Role updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    public function permission(Request $request)
    {
        $permission = Permission::create(['name' => $request['permission']]);

        return redirect(route('role.index'))->with('success', 'Data Berhasil Ditambahkan');;
    }

    public function filter(Request $request)
    {
        // 1. ambil data user
        $role = DB::table('roles')
            ->when($request->input('name'), function ($query, $data) {
                return $query->where('name', 'like', '%' . $data . '%');
            })
            ->when($request->input('email'), function ($query, $data) {
                return $query->where('email', 'like', '%' . $data . '%');
            })
            ->when($request->input('level'), function ($query, $data) {
                return $query->where('level', 'like',
                 '%' . $data . '%');
            })
            ->selectRaw("
            id,
            name,
            DATE_FORMAT(created_at,'%d-%m-%Y') as date
            ")
            ->get();

        // 2. ubah data user berupa datatable
        $datatable = DataTables::of($role)->make(true);

        // 3. return datatable
        return $datatable;
    }
    public function filter1(Request $request)
    {
        // 1. ambil data user
        $role = DB::table('permissions')
            ->when($request->input('name'), function ($query, $data) {
                return $query->where('name', 'like', '%' . $data . '%');
            })
            ->when($request->input('email'), function ($query, $data) {
                return $query->where('email', 'like', '%' . $data . '%');
            })
            ->when($request->input('level'), function ($query, $data) {
                return $query->where('level', 'like',
                 '%' . $data . '%');
            })
            ->selectRaw("
            id,
            name,
            DATE_FORMAT(created_at,'%d-%m-%Y') as date
            ")
            ->get();

        // 2. ubah data user berupa datatable
        $datatable = DataTables::of($role)->make(true);

        // 3. return datatable
        return $datatable;
    }
}
