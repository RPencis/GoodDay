<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Blogs extends Model
{

    protected $fillable = [
        'title',
        'short_description',
        'text',
        'user_create',
        'created_at',
        'updated_at',
    ];
}
