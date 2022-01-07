<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SuratAktifKuliah extends Model
{
    use HasFactory;
    protected $fillable = ['user_id', 
                            'file_ktm', 
                            'file_spp', 
                            'nama', 
                            'tempat_lahir', 
                            'tanggal_lahir', 
                            'npm', 
                            'program_studi', 
                            'program_pendidikan', 
                            'alamat', 'akademik_acc', 
                            'dekan_acc' ];

    public function user(){
        return $this->belongsTo(User::class);
    }
}
