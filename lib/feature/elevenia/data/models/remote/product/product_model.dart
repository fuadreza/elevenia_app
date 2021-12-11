
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';

class ProductModel extends Product {
  final String productName;
  final String productNumber;
  final String sellPrice;

  const ProductModel({
    required this.productName,
    required this.productNumber,
    required this.sellPrice,
  }): super(productName: productName, productNumber: productNumber, sellPrice: sellPrice);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['prdNm'],
      productNumber: json['prdNo'],
      sellPrice: json['selPrc'],
    );
  }
}
