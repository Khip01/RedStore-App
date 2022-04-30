import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:red_store/screens/add_product.dart';
import 'package:red_store/screens/edit_product.dart';
import 'package:red_store/screens/product_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = 'http://10.0.2.2:8000/api/products';

  // Android Studio (ADV) 10.0.2.2:8000
  Future getProducts() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future deleteProducts(String productId) async {
    String url = "http://10.0.2.2:8000/api/products/" + productId;

    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getProducts();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddProduct()));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('RedStore'),
        ),
        body: FutureBuilder(
          future: getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: (snapshot.data as dynamic)['data']
                      .length, // snapshot.data.length, error **fixed**
                  itemBuilder: (context, index) {
                    // Test check products output by text
                    /* return Text((snapshot.data as dynamic)['data'][index][
                        'name']); //snapshot.data['data'][index]['name'] error **fixed** */
                    return Container(
                      height: 100,
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetail(
                                            product: (snapshot.data
                                                as dynamic)['data'][index])));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0)),
                                padding: EdgeInsets.all(5),
                                height: 120,
                                width: 120,
                                //  Error starts here, error because Image.network
                                child: Image.network((snapshot.data
                                    as dynamic)['data'][index]['image_url']),
                                //  Error : ArgumentError (Invalid argument(s): No host specified in URI file:///) //error **fixed** by filling in all the image link fields / not NULL
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          (snapshot.data as dynamic)['data']
                                              [index]['name'],
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          (snapshot.data as dynamic)['data']
                                              [index]['description']),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Rp. ' +
                                            (snapshot.data as dynamic)['data']
                                                [index]['price']),
                                        Row(
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder:
                                                              (context) =>
                                                                  EditProduct(
                                                                    product: (snapshot.data
                                                                            as dynamic)['data']
                                                                        [index],
                                                                  )));
                                                },
                                                child: Icon(Icons.edit)),
                                            GestureDetector(
                                                onTap: () {
                                                  deleteProducts((snapshot.data
                                                                  as dynamic)[
                                                              'data'][index]['id']
                                                          .toString())
                                                      .then((value) {
                                                    setState(() {});
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                'Product Deleted Successfully!')));
                                                  });
                                                },
                                                child: Icon(Icons.delete)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Text('Data Error');
            }
          },
        ));
  }
}
