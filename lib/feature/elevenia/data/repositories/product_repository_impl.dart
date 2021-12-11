
import 'package:elevenia_app/core/error/failures.dart';
import 'package:elevenia_app/feature/elevenia/data/sources/remote/product_remote_data_source.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';
import 'package:elevenia_app/feature/elevenia/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<Product>> getProducts(String pageNumber) async {
    try {
      return await remoteDataSource.getProducts(pageNumber);
    } on ServerFailure {
      return await remoteDataSource.getProducts(pageNumber);
    }
  }

}
