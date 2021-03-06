
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';

class ProductModel extends Product {
  final String productName;
  final String productNumber;
  final String sellQuantity;
  final String sellPrice;
  final String categoryName;

  const ProductModel({
    required this.productName,
    required this.productNumber,
    required this.sellQuantity,
    required this.sellPrice,
    required this.categoryName,
  }): super(productName: productName, productNumber: productNumber, sellQuantity: sellQuantity, sellPrice: sellPrice, categoryName: categoryName);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['prdNm'] ?? '',
      productNumber: json['prdNo'] ?? '',
      sellQuantity: json['prdSelQty'] ?? '',
      sellPrice: json['selPrc'] ?? '',
      categoryName: json['dispCtgrNm'] ?? '',
    );
  }
}
