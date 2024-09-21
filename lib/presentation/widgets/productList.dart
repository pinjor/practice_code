import 'package:flutter/material.dart';
import 'package:practice_one/models/product.dart';

import 'package:practice_one/presentation/widgets/button_bar.dart';

class productItem extends StatelessWidget {
  productItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Code :${product.productCode}'),
          Text('Product Image: ${product.productimage}'),
          Text('unit price : ${product.unitPrice}'),
          Text('Quantity : ${product.Qty}'),
          Text('Total Price: ${product.totalPrice}'),
          buttonBar(productid: product.id, product: product),
        ],
      ),
    );
  }
}
