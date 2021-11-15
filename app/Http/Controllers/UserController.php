<?php

namespace App\Http\Controllers;

use App\Exports\UsersExport;
use App\Http\Requests\StoreUserRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\UsersImport;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //index -> menampilkan tabel data
        // mengambil data
        $user = User::all();
        //Role::create(['name' => 'user']);
        //Permission::create(['name' => 'manage user']);

        // menampilkan data
        return view('users.index')
            ->with('users', $user);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        // halaman tambah user
        $roles = Role::pluck('name', 'name')->all();
        $permission = Permission::pluck('name', 'name')->all();
        $rolePermissions = DB::table("role_has_permissions")
            ->pluck('role_has_permissions.permission_id', 'role_has_permissions.permission_id')
            ->all();

        return view('users.create', compact('roles', 'permission', 'rolePermissions'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreUserRequest $request)
    {
        //simpan data
        $user = User::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'password' => Hash::make($request['password']),
            'level' => $request['level'],
            'permission' => $request['permission'],

        ]);
        $user->assignRole($request->input('level'));
        // $user->givePermissionTo($request['permission']);


        return redirect(route('user.index'))->with('success', 'Data Berhasil Ditambahkan');;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        //nampilkan detail satu user
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        return view('users.edit')
            ->with('user', $user);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateUserRequest $request, User $user)
    {
        //mengupdate data user ke database
        $validate = $request->validated();

        $user->update($validate);
        return redirect()->route('user.index')->with('success', 'User Berhasil Diupdate');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        //delete data
        $user->delete();
        return response()->json([
            'message' => 'Data penerbangan berhasil dihapus!'
        ]);
    }

    public function export()
    {
        // export data ke excel
        return Excel::download(new UsersExport, 'users.xlsx');
    }

    public function import(Request $request)
    {
        // import excel ke data tables
        $users = Excel::toCollection(new UsersImport, $request->import_file);
        foreach ($users[0] as $user) {
            User::where('id', $user[0])->update([
                'name' => $user[1],
                'email' => $user[2],
                'password' => $user[3],
            ]);
        }
        return redirect()->route('user.index');
    }

    public function filter(Request $request)
    {
        // 1. ambil data user
        $users = DB::table('users')
            ->when($request->input('name'), function ($query, $data) {
                return $query->where('name', 'like', '%' . $data . '%');
            })
            ->when($request->input('email'), function ($query, $data) {
                return $query->where('email', 'like', '%' . $data . '%');
            })
            ->when($request->input('level'), function ($query, $data) {
                return $query->where(
                    'level',
                    'like',
                    '%' . $data . '%'
                );
            })
            ->selectRaw("
            id,
            name,
            email,
            level,
            permission,
            DATE_FORMAT(created_at,'%d-%m-%Y') as date
            ")
            ->get();

        // 2. ubah data user berupa datatable
        $datatable = DataTables::of($users)->make(true);

        // 3. return datatable
        return $datatable;
    }

    public function create_role()
    {
    }
}
