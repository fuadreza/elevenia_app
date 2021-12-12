
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';

class DetailProductModel extends DetailProduct {
  final String productName;
  final String productNumber;
  final String productImage;
  final String productDescription;
  final String sellPrice;

  const DetailProductModel({
    required this.productName,
    required this.productNumber,
    required this.productImage,
    required this.productDescription,
    required this.sellPrice,
  }): super(productName: productName, productNumber: productNumber, productImage: productImage, productDescription: productDescription, sellPrice: sellPrice);

  factory DetailProductModel.fromJson(Map<String, dynamic> json) {
    return DetailProductModel(
      productName: json['prdNm'] ?? '',
      productNumber: json['prdNo'] ?? '',
      productImage: json['prdImage01'] ?? '',
      productDescription: json['htmlDetail'] ?? '',
      sellPrice: json['selPrc'] ?? '',
    );
  }
}
