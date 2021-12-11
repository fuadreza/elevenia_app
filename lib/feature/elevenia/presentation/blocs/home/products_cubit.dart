import 'package:bloc/bloc.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';
import 'package:elevenia_app/feature/elevenia/domain/usecases/get_products_use_case.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/home/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GetProductUseCase getProductsUseCase;

  ProductsCubit({required this.getProductsUseCase}) : super(Init());

  Future<void> getRestaurants() async {
    emit(Loading());
    try {
      await getProductsUseCase.invoke('1').then((List<Product> value) {
        emit(Loaded(products: value));
      });
    } on Exception {
      emit(Error(message: 'Failed to load products list'));
    }
  }
}
