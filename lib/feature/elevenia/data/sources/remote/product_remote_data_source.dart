
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';

abstract class ProductRemoteDataSource {

  Future<List<Product>> getProducts(String pageNumber);

}
