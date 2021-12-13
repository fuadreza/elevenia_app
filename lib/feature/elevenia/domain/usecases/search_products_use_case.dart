
import 'package:elevenia_app/core/usecase/usecase.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';
import 'package:elevenia_app/feature/elevenia/domain/repositories/product_repository.dart';

class SearchProductsUseCase implements UseCase<String, List<Product>> {
  final ProductRepository repository;

  SearchProductsUseCase({required this.repository});

  @override
  Future<List<Product>> invoke(String params) async{
    return await repository.searchProducts(params);
  }
}
