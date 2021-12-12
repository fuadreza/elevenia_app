
import 'package:elevenia_app/feature/elevenia/data/models/remote/detail_product/detail_product_model.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';


class DetailProductDto {
  final DetailProduct detailProductModel;

  DetailProductDto({required this.detailProductModel});

  factory DetailProductDto.fromJson(Map<String, dynamic> json) {
    return DetailProductDto(
      detailProductModel: DetailProductModel.fromJson(json['Product']),
    );
  }

}
