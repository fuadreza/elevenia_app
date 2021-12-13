
import 'package:elevenia_app/core/usecase/usecase.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:elevenia_app/feature/elevenia/domain/repositories/product_repository.dart';

class GetCartProductsUseCase implements UseCase<NoParams, List<DetailProduct>> {
  final ProductRepository repository;

  GetCartProductsUseCase({required this.repository});

  @override
  Future<List<DetailProduct>> invoke(NoParams params) async{
    return await repository.getCartProducts();
  }
}
