<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Auth;
use App\Models\Role;

class RolesController extends \App\Http\Controllers\Controller
{
    public function __construct()
    {
        $this->middleware('can:role list', ['only' => ['index', 'show']]);
        $this->middleware('can:role create', ['only' => ['create', 'store']]);
        $this->middleware('can:role edit', ['only' => ['edit', 'update','permissions','permissionsStore']]);
        $this->middleware('can:role delete', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Inertia\Response
     */
    public function index()
    {
        $roles = (new Role)->newQuery();
        if (request()->has('search')) {
            $roles->where('name', 'Like', '%' . request()->input('search') . '%');
        }
        if (request()->query('sort')) {
            $attribute = request()->query('sort');
            $sort_order = 'ASC';
            if (strncmp($attribute, '-', 1) === 0) {
                $sort_order = 'DESC';
                $attribute = substr($attribute, 1);
            }
            $roles->orderBy($attribute, $sort_order);
        } else {
            $roles->latest();
        }
        $roles = $roles->paginate(10)->onEachSide(2);
        return Inertia::render('Admin/Role/Index', [
            'roles' => $roles,
            'filters' => request()->all('search'),
            'can' => [
                'create' => Auth::user()->can('role create'),
                'edit' => Auth::user()->can('role edit'),
                'delete' => Auth::user()->can('role delete'),
            ]
        ]);
    }
    
    /**
     * [Description for permissions]
     *
     * @param Role $role
     * 
     * @return \Inertia\Response
     * 
     */
    public function permissions(Role $role)
    {
        $permissions = \App\Models\Permission::all();
        $rolePermissions = $role->permissions;

        $permissionsOptions = [];
        $permissionsEnabled = [];
        foreach($permissions as $permission){
            $permissionsOptions[] = ['id' => $permission->id,'name' => $permission->name];
        }
        foreach($rolePermissions as $rolePermission){
            $permissionsEnabled[] = $rolePermission->id;
        }
        
        return Inertia::render('Admin/Role/Permissions', [
            'role' => $role,
            'permissionsEnabled' => $permissionsEnabled,
            'permissionsOptions' => $permissionsOptions
        ]);
    }

    public function permissionsStore(Request $request,Role $role)
    {
        $postData = $request->all();
        $permissions = $postData['permissions'];
        $role->syncPermissions($permissions);
        
        return redirect()->route('role.index')
            ->with('message', __('Permission created successfully.'));
    }

    private function getPermissions($role){
        $permissions = \App\Models\Permission::all();
        $rolePermissions = $role->permissions;

        $permissionsOptions = [];
        $permissionsEnabled = [];

        foreach($rolePermissions as $rolePermission){
            $permissionsEnabled[$rolePermission->id] = $rolePermission->id;
        }
        foreach($permissions as $index => $permission){
            $permissionsOptions[$index] = ['value' => (string)$permission->id,'label' => $permission->name];
            if(isset($permissionsEnabled[$rolePermission->id])){
                $permissionsOptions[$index]['checked'] = true;
            }
        }
    }
}
