<?php

namespace App\Models;

class Role extends \Spatie\Permission\Models\Role
{
    protected $permissionClass = '\App\Model\Permission';
    protected $fillable = [
        'name',
        'guard_name',
        'updated_at',
        'created_at'
    ];
}
