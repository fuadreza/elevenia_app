
import 'dart:convert';

import 'package:elevenia_app/core/error/exceptions.dart';
import 'package:elevenia_app/core/error/failures.dart';
import 'package:elevenia_app/feature/elevenia/data/models/remote/detail_product/detail_product_dto.dart';
import 'package:elevenia_app/feature/elevenia/data/models/remote/product/products_dto.dart';
import 'package:elevenia_app/feature/elevenia/data/services/api/product_service.dart';
import 'package:elevenia_app/feature/elevenia/data/sources/remote/product_remote_data_source.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {

  final ProductService service;

  ProductRemoteDataSourceImpl({required this.service});

  @override
  Future<List<Product>> getProducts(String pageNumber) async {
    try {
      final String response = await service.getProducts(pageNumber);
      final ProductsDto dto = ProductsDto.fromJson(jsonDecode(response));
      return dto.productsResponse.products;
    } on ServerException {
      throw ServerFailure();
    }
  }

  @override
  Future<DetailProduct> getDetailProduct(String productNumber) async {
    try {
      final String response = await service.getDetailProduct(productNumber);
      final DetailProductDto dto = DetailProductDto.fromJson(jsonDecode(response));
      return dto.detailProductModel;
    } on ServerException {
      throw ServerFailure();
    }
  }

}
