class Product {
  final String id;
  final String productName;
  final String productCode;
  final String productimage;
  final String unitPrice;
  final String Qty;
  final String totalPrice;
  final String createdAt;

  Product(
      {required this.id,
      required this.productName,
      required this.productCode,
      required this.productimage,
      required this.unitPrice,
      required this.Qty,
      required this.totalPrice,
      required this.createdAt});
}
