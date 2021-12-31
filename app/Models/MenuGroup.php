<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MenuGroup extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'icon', 'permisison_name'];

    public function menuItems()
    {
        return $this->hasMany(MenuItem::class);
    }
}
