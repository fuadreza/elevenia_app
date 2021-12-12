
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';

abstract class ProductLocalDataSource {

  Future<List<Product>> getProducts();

  Future<void> saveProducts(List<Product> products);

}
