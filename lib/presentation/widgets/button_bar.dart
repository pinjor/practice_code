import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:practice_one/models/product.dart';

import 'package:practice_one/presentation/screens/onTapEditButton.dart';

class buttonBar extends StatelessWidget {
  const buttonBar({
    super.key,
    required this.productid,
    required this.product,
  });
  final Product product;
  final String productid;

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        TextButton.icon(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return EditProductScreen(product: product);
              },
            ));
          },
          icon: Icon(Icons.edit),
          label: Text('Edit'),
        ),
        TextButton.icon(
          onPressed: () async {
            bool isDeleted = await deleteProduct(productid);
            if (isDeleted) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Product deleted successfully!'),
                backgroundColor: Colors.green,
              ));
            }
          },
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          label: Text(
            'Delete',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

Future<bool> deleteProduct(String productid) async {
  Uri uri =
      Uri.parse('http://164.68.107.70:6060/api/v1/DeleteProduct/$productid');
  final response = await get(uri);

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    return jsonResponse['data']['acknowledged'] == true &&
        jsonResponse['data']['deletedCount'] > 0;
  }
  return false;
}
