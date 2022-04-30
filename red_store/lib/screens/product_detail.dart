import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final Map product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RedStore")),
      body: Column(
        children: [
          Container(
            width: 300,
            height: 300,
            child: Image.network(product['image_url']),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  product['name'],
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                Text(product['description']),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(product['price']),
                      Row(
                        children: [
                          Icon(Icons.thumb_up),
                          Text('    '),
                          Icon(Icons.thumb_down)
                        ],
                      ),
                    ])
              ],
            ),
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
