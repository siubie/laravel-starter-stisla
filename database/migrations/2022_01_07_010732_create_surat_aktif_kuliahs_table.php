<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSuratAktifKuliahsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('surat_aktif_kuliahs', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->string('file_ktm', 191);
            $table->string('file_spp', 191);
            $table->string('nama', 191);  
            $table->string('tempat_lahir', 191);  
            $table->date('tanggal_lahir');
            $table->integer('npm');  
            $table->string('program_studi', 191);  
            $table->string('program_pendidikan', 191);  
            $table->string('alamat', 191);  
            $table->boolean('akademik_acc')->default(0);
            $table->boolean('dekan_acc')->default(0);
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('surat_aktif_kuliahs');
    }
}
