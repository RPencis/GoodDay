<?php

namespace App\Http\Controllers;

use App\Models\News;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class NewsController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:news list', ['only' => ['index', 'show']]);
        $this->middleware('can:news create', ['only' => ['create', 'store']]);
        $this->middleware('can:news edit', ['only' => ['edit', 'update']]);
        $this->middleware('can:news delete', ['only' => ['destroy']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Inertia\Response
     */
    public function index()
    {
        $news = (new News)->newQuery();
        if (request()->has('search')) {
            $news->where('name', 'Like', '%' . request()->input('search') . '%');
        }

        $news->latest();

        $news = $news->paginate(3)->onEachSide(2);

        return Inertia::render('News/Index', [
            'allNews' => $news,
            'filters' => request()->all('search'),
            'can' => [
                'create' => Auth::user()->can('news create'),
                'edit' => Auth::user()->can('news edit'),
                'delete' => Auth::user()->can('news delete'),
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
        return Inertia::render('News/Create');
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

        News::create($data);

        return redirect()->route('news.index')
            ->with('message', __('News created successfully.'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\News  $news
     * @return \Inertia\Response
     */
    public function show(News $news)
    {
        return Inertia::render('News/Show', [
            'news' => $news,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\News  $news
     * @return \Inertia\Response
     */
    public function edit(News $news)
    {
        return Inertia::render('News/Edit', [
            'news' => $news,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\News  $news
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, News $news)
    {
        $news->update($request->all());
        return redirect()->route('news.index')
            ->with('message', __('News updated successfully.'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\News  $news
     * @return \Illuminate\Http\Response
     */
    public function destroy(News $news)
    {
        $news->delete();
        return redirect()->route('news.index')
            ->with('message', __('News deleted successfully'));
    }
}
