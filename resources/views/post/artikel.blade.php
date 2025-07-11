@extends('layout')
@section('content')
<section class="text-gray-600 body-font">
  <div class="container mx-auto flex px-5 py-24 md:flex-row flex-col items-center">
    <div class="lg:max-w-lg lg:w-full md:w-1/2 w-5/6 mb-10 md:mb-0">
      <img class="w-[200px] h-auto object-cover object-center rounded" alt="hero"
       src="{{ $post->getFirstMediaUrl('featured_image') != '' ? $post->getFirstMediaUrl('featured_image') : 'https://dummyimage.com/1200x500' }}">
    </div>
    <div class="lg:flex-grow md:w-1/2 lg:pl-24 md:pl-16 flex flex-col md:items-start md:text-left items-center text-center">
      <h1 class="title-font sm:text-4xl text-3xl mb-4 font-medium text-gray-900">{{ $post->title}}</h1>
      <p class="text-gray-700">
      {{ \Illuminate\Support\Str::limit(strip_tags($post->content), 500, '...') }}
      </p>  
      <div class="flex justify-center">
        <button class="inline-flex text-white bg-indigo-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded text-lg">Button</button>
        <button class="ml-4 inline-flex text-gray-700 bg-gray-100 border-0 py-2 px-6 focus:outline-none hover:bg-gray-200 rounded text-lg">Button</button>
      </div>
    </div>
  </div>
</section>
@endsection