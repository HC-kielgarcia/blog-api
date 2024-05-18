<?php

namespace App\Http\Controllers;

use App\Http\Resources\BlogResource;
use App\Mail\BlogMail;
use App\Models\Blog;
use App\Http\Requests\StoreBlogRequest;
use App\Http\Requests\UpdateBlogRequest;
use App\Models\User;
use Mail;


class BlogController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $blogs = Blog::with('author')->get();
        return BlogResource::collection($blogs);
        
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreBlogRequest $request)
    {
        $blog = Blog::create($request->validated());

        

        // Activity Logs 
        activity()
            ->performedOn($blog)
            ->causedBy(auth()->user())
            ->withProperties(['attributes' => $request->validated()])
            ->log('Created a blog');


        $recipient = User::findOrFail($blog->author_id);
        
        // Mail data 
        $blogDetails = [
            'recipient' => $recipient,
            'subject' => $blog->title,
            'body' => $blog->body
        ];

        // Send Email 
        Mail::to($blogDetails['recipient'])->send(new BlogMail($blogDetails));

        return BlogResource::make($blog);

        // return response()->json($blog->title.' created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Blog $blog)
    {
        $blog->get();
        return BlogResource::make($blog);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Blog $blog)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateBlogRequest $request, Blog $blog)
    {
        $blog->update($request->validated());

        // Activity Logs 
        activity()
            ->performedOn($blog)
            ->causedBy(auth()->user())
            ->withProperties(['attributes' => $request->validated()])
            ->log('Updated a blog');


        return BlogResource::make($blog);

        // return response()->json($blog->title.' updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Blog $blog)
    {
        $blog->delete();

        // Activity Logs 
        activity()
            ->performedOn($blog)
            ->causedBy(auth()->user())
            ->withProperties(['attributes' => $blog])
            ->log('Deleted a blog');

        return response()->json($blog->title.' deleted successfully.');
    }
}
