import 'package:bloc/bloc.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:elevenia_app/feature/elevenia/domain/usecases/add_product_to_cart_use_case.dart';
import 'package:elevenia_app/feature/elevenia/domain/usecases/get_detail_product_use_case.dart';
import 'package:elevenia_app/feature/elevenia/domain/usecases/remove_product_from_cart_use_case.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/detail_product/detail_product_state.dart';

class DetailProductCubit extends Cubit<DetailProductState> {
  final GetDetailProductUseCase getDetailProductUseCase;
  final AddProductToCartUseCase addProductToCartUseCase;
  final RemoveProductFromCartUseCase removeProductFromCartUseCase;

  DetailProductCubit({
    required this.getDetailProductUseCase,
    required this.addProductToCartUseCase,
    required this.removeProductFromCartUseCase,
  }) : super(Init());

  Future<void> getDetailProduct(String productNumber) async {
    emit(Loading());
    try {
      final DetailProduct? product = await getDetailProductUseCase.invoke(productNumber);
      if(product != null) {
        emit(Loaded(product: product));
      } else {
        emit(Error(message: 'Failed to load Product'));
      }
    } on Exception {
      emit(Error(message: 'Failed to load Product'));
    }
  }

  Future<void> addProductToCart(DetailProduct detailProduct) async {
    try {
      await addProductToCartUseCase.invoke(detailProduct);
    } on Exception {
      throw Exception();
    }
  }

}
