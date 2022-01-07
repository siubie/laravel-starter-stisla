<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SuratAktifKuliahController extends Controller
{
    public function index(Request $request){

        $suratAktifKuliahs = DB::table('surat_aktif_kuliahs')
        ->select('surat_atrif_kuliahs.*', 'users.name as user_name')
        ->join('users', 'surat_aktif_kuliahs.user_id', '=' , 'users.id');

        return view('surat.surat-aktif-kuliah.index', compact('suratAktifKuliahs'));
    }

    public function create(){
        return view('surat.surat-aktif-kuliah.create');
    }
}
