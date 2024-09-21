import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:practice_one/models/product.dart';
import 'package:practice_one/presentation/screens/add_New_Screen.dart';
import 'package:practice_one/presentation/widgets/productList.dart';

class productListScreen extends StatefulWidget {
  const productListScreen({super.key});

  @override
  State<productListScreen> createState() => _productListScreenState();
}

class _productListScreenState extends State<productListScreen> {
  List<Product> productList = [];
  bool _inprogress = false;
  @override
  void initState() {
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
              onPressed: () {
                getProductList();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: _inprogress == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return productItem(
                    product: productList[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10, child: Divider());
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return add_New_Screen();
                },
              ));
            }
            ;
          }),
    );
  }

  Future<void> getProductList() async {
    _inprogress = true;
    setState(() {});
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(uri);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      productList.clear();

      Map<String, dynamic> jsonresponse = jsonDecode(response.body);
      for (var item in jsonresponse['data']) {
        Product products = Product(
            id: item['_id'] ?? '',
            productName: item['ProductName'] ?? '',
            productCode: item['ProductCode'] ?? '',
            productimage: item['Img'] ?? '',
            unitPrice: item['UnitPrice'] ?? '',
            Qty: item['Qty'] ?? '',
            totalPrice: item['TotalPrice'] ?? '',
            createdAt: item['CreatedDate'] ?? '');
        productList.add(products);
      }
    }
    _inprogress = false;
    setState(() {});
  }
}
