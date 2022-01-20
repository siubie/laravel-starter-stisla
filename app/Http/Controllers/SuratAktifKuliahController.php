<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SuratAktifKuliahController extends Controller
{
    public function index(Request $request)
    {

        $suratAktifKuliahs = DB::table('surat_aktif_kuliahs')
            ->select('surat_attif_kuliahs.*')
            ->join('users', 'surat_aktif_kuliahs.user_id', '=', 'users.id');

        return view('surat.surat-aktif-kuliah.index', compact('suratAktifKuliahs'));
    }

    public function create()
    {
        return view('surat.surat-aktif-kuliah.create');
    }
}
