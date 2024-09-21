import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class add_New_Screen extends StatefulWidget {
  const add_New_Screen({super.key});

  @override
  State<add_New_Screen> createState() => _add_New_ScreenState();
}

class _add_New_ScreenState extends State<add_New_Screen> {
  final TextEditingController productNameTEController = TextEditingController();
  final TextEditingController productCodeTEController = TextEditingController();
  final TextEditingController unitPriceTEController = TextEditingController();
  final TextEditingController quantityTEController = TextEditingController();
  final TextEditingController totalPriceTEController = TextEditingController();
  final TextEditingController productImageTEController =
      TextEditingController();

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool _inprogress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Lists'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: globalKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: productNameTEController,
                    decoration: InputDecoration(
                      labelText: 'Product Name',
                      hintText: 'Product Name',
                    ),
                    validator: (String? value) {
                      if (value == null || value!.isEmpty) {
                        return 'Enter valid value';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: unitPriceTEController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Unit Price',
                      hintText: 'Unit Price',
                    ),
                    validator: (String? value) {
                      if (value == null || value!.isEmpty) {
                        return 'enter validated value';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: productImageTEController,
                    decoration: InputDecoration(
                      labelText: 'Product Image',
                      hintText: 'Product Image',
                    ),
                    validator: (String? value) {
                      if (value == null || value!.isEmpty) {
                        return 'enter validated value';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: productCodeTEController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Product Code',
                      hintText: 'Product Code',
                    ),
                    validator: (String? value) {
                      if (value == null || value!.isEmpty) {
                        return 'enter validated value';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: quantityTEController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      hintText: 'Quantity',
                    ),
                    validator: (String? value) {
                      if (value == null || value!.isEmpty) {
                        return 'enter validated value';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: totalPriceTEController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Total Price',
                      hintText: 'Total Price',
                    ),
                    validator: (String? value) {
                      if (value == null || value!.isEmpty) {
                        return 'enter validated value';
                      }
                      return null;
                    },
                  ),
                ),
                _inprogress
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: _onTapAddProductButton,
                        child: Text('Add Product'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapAddProductButton() {
    if (globalKey.currentState!.validate()) {
      addNewProduct();
    }
  }

  Future<void> addNewProduct() async {
    _inprogress = true;
    setState(() {});

    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');

    Map<String, dynamic> requestbody = {
      "Img": productImageTEController.text,
      "ProductCode": productCodeTEController.text,
      "ProductName": productNameTEController.text,
      "Qty": quantityTEController.text,
      "TotalPrice": totalPriceTEController.text,
      "UnitPrice": unitPriceTEController.text
    };

    Response response = await post(uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestbody));

    if (response.statusCode == 200) {
      _clearform();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('product added'),
        backgroundColor: Colors.green,
      ));
    }
    _inprogress = false;
    setState(() {});
  }

  void _clearform() {
    productNameTEController.clear();
    productCodeTEController.clear();
    unitPriceTEController.clear();
    quantityTEController.clear();
    totalPriceTEController.clear();
    productImageTEController.clear();
  }

  @override
  void dispose() {
    productNameTEController.dispose();
    productCodeTEController.dispose();
    unitPriceTEController.dispose();
    quantityTEController.dispose();
    totalPriceTEController.dispose();
    productImageTEController.dispose();

    super.dispose();
  }
}
