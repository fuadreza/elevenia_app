
import 'package:elevenia_app/core/usecase/usecase.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:elevenia_app/feature/elevenia/domain/repositories/product_repository.dart';

class GetDetailProductUseCase implements UseCase<String, DetailProduct> {
  final ProductRepository repository;

  GetDetailProductUseCase({required this.repository});

  @override
  Future<DetailProduct> invoke(String params) async{
    return await repository.getDetailProduct(params);
  }
}
