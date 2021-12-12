
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';

abstract class ProductLocalDataSource {

  Future<List<Product>> getProducts();

  Future<DetailProduct> getDetailProduct(String productNumber);

  Future<void> saveProducts(List<Product> products);

  Future<void> saveDetailProduct(DetailProduct detailProduct);

}
