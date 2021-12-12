
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
      return await remoteDataSource.getDetailProduct(productNumber);
    } on ServerFailure {
      return await remoteDataSource.getDetailProduct(productNumber);
    }
  }
}
