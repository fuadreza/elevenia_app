import 'package:bloc/bloc.dart';
import 'package:elevenia_app/core/usecase/usecase.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:elevenia_app/feature/elevenia/domain/usecases/get_cart_products_use_case.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/cart/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartProductsUseCase getCartProductsUseCase;

  CartCubit({required this.getCartProductsUseCase}) : super(Init());

  Future<void> getCartProducts() async {
    emit(Loading());
    try {
      final List<DetailProduct> productList = await getCartProductsUseCase.invoke(NoParams());
      if(productList.isNotEmpty) {
        emit(Loaded(products: productList));
      } else {
        emit(Error(message: 'Cart empty'));
      }
    } on Exception {
      emit(Error(message: 'Failed to load cart list'));
    }
  }

}
