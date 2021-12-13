
import 'package:elevenia_app/core/usecase/usecase.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:elevenia_app/feature/elevenia/domain/repositories/product_repository.dart';

class RemoveProductFromCartUseCase implements UseCase<DetailProduct, void> {
  final ProductRepository repository;

  RemoveProductFromCartUseCase({required this.repository});

  @override
  Future<void> invoke(DetailProduct detailProduct) async {
    return await repository.removeProductFromCart(detailProduct);
  }
}
