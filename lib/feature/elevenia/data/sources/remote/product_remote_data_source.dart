
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';

abstract class ProductRemoteDataSource {

  Future<List<Product>> getProducts(String pageNumber);

  Future<DetailProduct> getDetailProduct(String productNumber);

}
