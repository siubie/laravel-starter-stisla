<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admin =  User::create([
            'name' => "Admin",
            'email' => "dindalia@gmail.com",
            'password' => Hash::make('dinda123'),
        ]);

        $admin->assignRole('admin');


        $user = User::create([
            'name' => "user",
            'email' => "user@gmail.com",
            'password' => Hash::make('dinda123'),
        ]);

        $user->assignRole('user');
    }
}
