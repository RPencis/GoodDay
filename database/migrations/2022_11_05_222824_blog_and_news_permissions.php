<?php

use App\Models\Permission;
use Illuminate\Database\Migrations\Migration;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {   
        Permission::create(['name' => 'blog list','guard_name' => 'web']);
        Permission::create(['name' => 'blog create','guard_name' => 'web']);
        Permission::create(['name' => 'blog edit','guard_name' => 'web']);
        Permission::create(['name' => 'blog delete','guard_name' => 'web']);

        Permission::create(['name' => 'news list', 'guard_name' => 'web']);
        Permission::create(['name' => 'news create', 'guard_name' => 'web']);
        Permission::create(['name' => 'news edit', 'guard_name' => 'web']);
        Permission::create(['name' => 'news delete', 'guard_name' => 'web']);

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Permission::where('name', 'blog list')->first()->delete();
        Permission::where('name', 'blog create')->first()->delete();
        Permission::where('name', 'blog edit')->first()->delete();
        Permission::where('name', 'blog delete')->first()->delete();

        Permission::where('name', 'news list')->first()->delete();
        Permission::where('name', 'news create')->first()->delete();
        Permission::where('name', 'news edit')->first()->delete();
        Permission::where('name', 'news delete')->first()->delete();
    }
};
