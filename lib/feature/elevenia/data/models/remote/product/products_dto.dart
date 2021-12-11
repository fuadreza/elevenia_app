
import 'package:elevenia_app/feature/elevenia/data/models/remote/product/product_model.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';


class ProductsDto {
  final ProductsResponse productsResponse;

  ProductsDto({required this.productsResponse});

  factory ProductsDto.fromJson(Map<String, dynamic> json) {
    return ProductsDto(
      productsResponse: ProductsResponse.fromJson(json['Products']),
    );
  }

}

class ProductsResponse {
  final List<Product> products;

  ProductsResponse({required this.products});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      products: parseProducts(json['product']),
    );
  }

  static List<Product> parseProducts(json) {
    final List list = json as List;
    final List<Product> products = list.map((data) => ProductModel.fromJson(data)).toList();
    return products;
  }

}
