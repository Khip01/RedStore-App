<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class ProductApiController extends Controller
{
    public function index() {
        $products = Product::all();
        return response()->json(['message' => 'success', 'data' => $products]);
    }

    public function show($id) {
        $product = Product::find($id);
        return response()->json(['message' => 'succes', 'data' => $product]);
    }

    public function store(request $request) {
        $product = Product::create($request->all());
        return response()->json(['message' => 'data has been inserted successfully', 'data' => $product]);
    }

    public function update(request $request, $id) {
        $product = Product::find($id);
        $product->update($request->all());
        return response()->json(['message' => 'success', 'data' => $product]);
    }

    public function destroy($id){
        $product = Product::find($id);
        $product->delete();
        return response()->json(['message' => 'success', 'data' => NULL]);
    }

}
