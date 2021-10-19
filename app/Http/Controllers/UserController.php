<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreUserRequest;
use Illuminate\Http\Request;
use DataTables;
use Validator;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

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
        $users = User::all();
        return view('table-user')
            ->with('users', $users);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        // halaman tambah user
        return view('create-user');
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
        // User::create($request->validated());
        User::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'password' => Hash::make($request['password']),
        ]);
        return redirect(route('user.index'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //nampilkan detail satu user
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //menampilkan form edit data user
        // $users = User::find($id);
        // return view('edit-user', compact('users', 'users'));
        $user = User::find($id);

        return view('edit-user')
            ->with('user', $user);
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
        //mengupdate data user ke database

        $users = User::findOrFail($id);
        $this->validate($request, [
            'name' => 'required',        
            'email' => 'required|email',
        ]);

        $input = $request->all();
        $users->fill($input)->save();
        return redirect()->route('user.index');

        // $users = User::find($id)->update($request->all());
        // return back()->with('Success', ' User Edited Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //delete data
    }


    // /**
    //  * Store a newly created resource in storage.
    //  *
    //  * @param  \Illuminate\Http\Request  $request
    //  * @return \Illuminate\Http\Response
    //  */
    // public function create()
    // {
    //     return view('create-user');
    // }
    // public function store(Request $request)
    // {
    //     User::create([
    //     'name' => $request->name,
    //     'email' => $request->email,
    //     'password' => $request->password
    //     ]);
    //     return redirect('table-user')->with('Success', 'User added successfully');
    // }

    // public function edit(Request $request)
    // {
    //     $where = array('id' => $request->id);
    //     $user  = User::where($where)->first();

    //     return Response()->json($user);
    // }

    // public function destroy(Request $request)
    // {
    //     $user = User::where('id', $request->id)->delete();

    //     return Response()->json($user);
    // }
}
