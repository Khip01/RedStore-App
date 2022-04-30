import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:red_store/screens/HomePage.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  Future saveProduct() async {
    final response =
        await http.post(Uri.parse('http://10.0.2.2:8000/api/products'), body: {
      'name': _nameController.text,
      'description': _descriptionController.text,
      'image_url': _imageUrlController.text,
      'price': _priceController.text
    });
    print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter product name';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(labelText: 'Description'),
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter product name';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                    controller: _imageUrlController,
                    decoration: InputDecoration(labelText: 'Image URL'),
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter product name';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                    controller: _priceController,
                    decoration: InputDecoration(labelText: 'Price'),
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter product name';
                      }
                      return null;
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      saveProduct().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Product Added Successfully!')));
                      });
                    }
                  },
                  child: Text('Save Product'))
            ],
          )),
    );
  }
}
