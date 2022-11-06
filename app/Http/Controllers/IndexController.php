<?php

namespace App\Http\Controllers;

use App\Models\Blogs;
use App\Models\News;
use Inertia\Inertia;
use Illuminate\Support\Facades\Route;

class IndexController extends Controller
{
    /**
     * landing page
     *
     * @return \Inertia\Response
     *
     */
    public function index()
    {
        $blogs = Blogs::orderBy('created_at','DESC')->limit(3)->get();
        $news = News::orderBy('created_at','DESC')->limit(3)->get();

        return Inertia::render('Index/Index', [
            'blogs' => $blogs,
            'allNews' => $news,
            'canLogin' => Route::has('login'),
            'canRegister' => Route::has('register'),
        ]);

    }
}
