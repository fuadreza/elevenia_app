
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';

abstract class ProductRepository {

  Future<List<Product>> getProducts(String pageNumber);

  Future<DetailProduct> getDetailProduct(String productNumber);

  Future<List<DetailProduct>> getCartProducts();

  Future<void> addProductToCart(DetailProduct detailProduct);

  Future<void> removeProductFromCart(DetailProduct detailProduct);

}
