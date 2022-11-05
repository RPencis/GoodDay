<?php

namespace App\Http\Controllers;

use App\Models\Blogs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class BlogController extends Controller
{

    public function __construct()
    {
        $this->middleware('can:blog list', ['only' => ['index', 'show']]);
        $this->middleware('can:blog create', ['only' => ['create', 'store']]);
        $this->middleware('can:blog edit', ['only' => ['edit', 'update']]);
        $this->middleware('can:blog delete', ['only' => ['destroy']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Inertia\Response
     */
    public function index()
    {
        $blogs = (new Blogs)->newQuery();
        if (request()->has('search')) {
            $blogs->where('name', 'Like', '%' . request()->input('search') . '%');
        }

        $blogs->latest();

        $blogs = $blogs->paginate(3)->onEachSide(2);

        return Inertia::render('Blog/Index', [
            'blogs' => $blogs,
            'filters' => request()->all('search'),
            'can' => [
                'create' => Auth::user()->can('blog create'),
                'edit' => Auth::user()->can('blog edit'),
                'delete' => Auth::user()->can('blog delete'),
            ],
            'user' => Auth::user(),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Inertia\Response
     */
    public function create()
    {
        return Inertia::render('Blog/Create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->all();
        $data['user_create'] = Auth::user()->id;

        Blogs::create($data);

        return redirect()->route('blog.index')
            ->with('message', __('Blog created successfully.'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Blogs  $blog
     * @return \Inertia\Response
     */
    public function show(Blogs $blog)
    {
        return Inertia::render('Blog/Show',[
            'blog' => $blog,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Blogs  $blog
     * @return \Inertia\Response
     */
    public function edit(Blogs $blog)
    {
        return Inertia::render('Blog/Edit', [
            'blog' => $blog,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Blogs  $blog
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Blogs $blog)
    {
        $blog->update($request->all());
        return redirect()->route('blog.index')
            ->with('message', __('Blog updated successfully.'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Blogs  $blog
     * @return \Illuminate\Http\Response
     */
    public function destroy(Blogs $blog)
    {
        $blog->delete();
        return redirect()->route('blog.index')
            ->with('message', __('Blog deleted successfully'));
    }
}
