<h1>List Products</h1>
<table>
    <thead>
        <tr>
            <th>No</th>
            <th>Name</th>
            <th>Desctription</th>
            <th>Price</th>
        </tr>
    </thead>
    <tbody>
        @foreach($products as $product)
            <tr>
                <td>{{$product->id}}</td>
                <td>{{$product->name}}</td>
                <td>{{$product->description}}</td>
                <td>{{$product->price}}</td>
                <td>
                    <a href="products/{{$product->id}}/edit">Edit</a>
                    <form action="/products/{{$product->id}}" method="POST">
                        @method('DELETE')
                        @csrf
                        <input type="submit" value="Delete">
                    </form>
                </td>
            </tr>
        @endforeach
    </tbody>
</table>
<p>
    Want's to create some product? Let's create <br>
    <a href="/products/create"><input type="submit" value="Create!"></a>
</p>
