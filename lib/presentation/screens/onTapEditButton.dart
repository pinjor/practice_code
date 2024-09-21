import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:practice_one/models/product.dart';

class EditProductScreen extends StatefulWidget {
  final Product product;

  EditProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers to hold the current product data
  late TextEditingController productNameController;
  late TextEditingController productCodeController;
  late TextEditingController unitPriceController;
  late TextEditingController quantityController;
  late TextEditingController totalPriceController;
  late TextEditingController productImageController;

  @override
  void initState() {
    super.initState();

    // Initialize controllers with existing product data
    productNameController =
        TextEditingController(text: widget.product.productName);
    productCodeController =
        TextEditingController(text: widget.product.productCode);
    unitPriceController = TextEditingController(text: widget.product.unitPrice);
    quantityController = TextEditingController(text: widget.product.Qty);
    totalPriceController =
        TextEditingController(text: widget.product.totalPrice);
    productImageController =
        TextEditingController(text: widget.product.productimage);
  }

  @override
  void dispose() {
    productNameController.dispose();
    productCodeController.dispose();
    unitPriceController.dispose();
    quantityController.dispose();
    totalPriceController.dispose();
    productImageController.dispose();
    super.dispose();
  }

  Future<void> updateProduct() async {
    if (_formKey.currentState!.validate()) {
      try {
        Uri uri = Uri.parse(
            'http://164.68.107.70:6060/api/v1/UpdateProduct/${widget.product.id}');
        final response = await http.post(
          uri,
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, dynamic>{
            'ProductName': productNameController.text,
            'ProductCode': productCodeController.text,
            'UnitPrice': unitPriceController.text,
            'Qty': quantityController.text,
            'TotalPrice': totalPriceController.text,
          }),
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> jsonResponse = jsonDecode(response.body);

          if (jsonResponse['data']['acknowledged'] == true &&
              jsonResponse['data']['modifiedCount'] > 0) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Product updated successfully!'),
              backgroundColor: Colors.green,
            ));
            Navigator.pop(context); // Close the edit screen
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('No changes were made.'),
              backgroundColor: Colors.orange,
            ));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Failed to update product.'),
            backgroundColor: Colors.red,
          ));
        }
      } catch (e) {
        print('Error updating product: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error occurred '),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: productNameController,
                    decoration: InputDecoration(labelText: 'Product Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter valid value';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: productCodeController,
                    decoration: InputDecoration(labelText: 'Product Code'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter valid value';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: unitPriceController,
                    decoration: InputDecoration(labelText: 'Unit Price'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter valid value';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: quantityController,
                    decoration: InputDecoration(labelText: 'Quantity'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter valid value';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: productImageController,
                    decoration: InputDecoration(labelText: 'ProductImage'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter valid value';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: totalPriceController,
                    decoration: InputDecoration(labelText: 'Total Price'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter valid value';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: updateProduct,
                  child: Text('Save Changes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
