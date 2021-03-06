
import 'package:elevenia_app/core/error/failures.dart';
import 'package:elevenia_app/feature/elevenia/data/sources/local/product_local_data_source.dart';
import 'package:elevenia_app/feature/elevenia/data/sources/remote/product_remote_data_source.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';
import 'package:elevenia_app/feature/elevenia/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<Product>> getProducts(String pageNumber) async {
    try {
      final List<Product> products = await remoteDataSource.getProducts(pageNumber);
      localDataSource.saveProducts(products);
      return products;
    } on ServerFailure {
      return await localDataSource.getProducts();
    }
  }

  @override
  Future<DetailProduct> getDetailProduct(String productNumber) async {
    try {
      final DetailProduct resultDetailProduct = await remoteDataSource.getDetailProduct(productNumber);
      final bool isProductOnCart = await localDataSource.isProductOnCart(productNumber);
      final DetailProduct detailProduct = DetailProduct(
          productName: resultDetailProduct.productName,
          productNumber: resultDetailProduct.productNumber,
          productImage: resultDetailProduct.productImage,
          productDescription: resultDetailProduct.productDescription,
          sellPrice: resultDetailProduct.sellPrice,
          isOnCart: isProductOnCart,
      );
      localDataSource.saveDetailProduct(detailProduct);
      return detailProduct;
    } on ServerFailure {
      return await localDataSource.getDetailProduct(productNumber);
    }
  }

  @override
  Future<List<Product>> searchProducts(String keyword) async {
    List<Product> productList = <Product>[];
    try {
      final List<Product> products = await remoteDataSource.getProducts('1');
      productList.addAll(products);
    } on ServerFailure {
      final List<Product> products = await localDataSource.getProducts();
      productList.addAll(products);
    }
    final List<Product> filteredList = productList.where((Product item) => item.productName.toLowerCase().contains(keyword.toLowerCase())).toList();
    return filteredList;
  }

  @override
  Future<List<DetailProduct>> getCartProducts() async {
    try {
      final List<DetailProduct> products = await localDataSource.getCartProducts();
      return products;
    } on Exception {
      throw Exception('Cannot load cart');
    }
  }

  @override
  Future<void> addProductToCart(DetailProduct detailProduct) async {
    try {
      return await localDataSource.addProductToCart(detailProduct);
    } on Exception {
      throw Exception('Cannot add to cart');
    }
  }

  @override
  Future<void> removeProductFromCart(DetailProduct detailProduct) async {
    try {
      return await localDataSource.removeProductFromCart(detailProduct);
    } on Exception {
      throw Exception('Cannot remove from cart');
    }
  }
}
