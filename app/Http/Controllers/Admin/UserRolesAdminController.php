<?php

namespace App\Http\Controllers\Admin;

use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

/**
 * @todo need to fix editing roles
 */
class UserRolesAdminController extends \App\Http\Controllers\Controller

{
    public function __construct()
    {
        $this->middleware('can:user list', ['only' => ['index', 'show']]);
        $this->middleware('can:user create', ['only' => ['create', 'store']]);
        $this->middleware('can:user edit', ['only' => ['edit', 'update']]);
        $this->middleware('can:user delete', ['only' => ['destroy']]);
    }
    public function index()
    {
        $users = (new User)->newQuery();
        if (request()->has('search')) {
            $users->where('name', 'Like', '%' . request()->input('search') . '%');
        }
        if (request()->query('sort')) {
            $attribute = request()->query('sort');
            $sort_order = 'ASC';
            if (strncmp($attribute, '-', 1) === 0) {
                $sort_order = 'DESC';
                $attribute = substr($attribute, 1);
            }
            $users->orderBy($attribute, $sort_order);
        } else {
            $users->latest();
        }
        $users = $users->paginate(10)->onEachSide(2);
        $userRoles = [];
        foreach ($users as $user) {
            $userRoles[$user->id] = $user->getRoleNames()->implode(',');
        }
        return Inertia::render('Admin/UserRoles/Index', [
            'users' => $users,
            'userRoles' => $userRoles,
            'filters' => request()->all('search'),
            'can' => [
                'create' => Auth::user()->can('user create'),
                'edit' => Auth::user()->can('user edit'),
                'delete' => Auth::user()->can('user delete'),
            ],
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Inertia\Response
     */
    public function show(User $user)
    {
        return Inertia::render('Admin/UserRoles/Show', [
            'user' => $user,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Inertia\Response
     */
    public function edit(User $user)
    {
        $roles = Role::all();

        $roleOptions = [];
        $rolesEnabled = [];
        foreach ($roles as $role) {
            $roleOptions[] = ['id' => $role->id, 'name' => $role->name];
            if($user->hasRole($role->name)){
                $rolesEnabled[] = $role->id;
            }
        }
        return Inertia::render('Admin/UserRoles/Edit', [
            'user' => $user,
            'roleOptions' => $roleOptions,
            'rolesEnabled' => $rolesEnabled,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $blog
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        $postData = $request->all();
        $user->syncRoles($postData['roles']);
        return redirect()->route('user-roles.index')
            ->with('message', __('User updated successfully.'));
    }
}
