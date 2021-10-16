<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DataTables;
use Validator;
use App\Models\User;

class UserController extends Controller
{
    //
    public function index()
    {
        if (request()->ajax()) {
            return datatables()->of(User::select('*'))
                ->addColumn('action', 'user-action')
                ->rawColumns(['action'])
                ->addIndexColumn()
                ->make(true);
        }
        return view('table-user');
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $id = $request->id;

        $user   =   User::updateOrCreate(
            [
                'id' => $id
            ],
            [
                'name' => $request->name,
                'email' => $request->email,
                'password' => $request->password
            ]
        );

        return Response()->json($user);
    }

    public function edit(Request $request)
    {
        $where = array('id' => $request->id);
        $user  = User::where($where)->first();

        return Response()->json($user);
    }

    public function destroy(Request $request)
    {
        $user = User::where('id', $request->id)->delete();

        return Response()->json($user);
    }
}