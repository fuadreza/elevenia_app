import 'package:bloc/bloc.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';
import 'package:elevenia_app/feature/elevenia/domain/usecases/search_products_use_case.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/search/search_products_state.dart';

class SearchProductsCubit extends Cubit<SearchProductsState> {
  final SearchProductsUseCase searchProductsUseCase;

  SearchProductsCubit({required this.searchProductsUseCase}) : super(Init());

  Future<void> searchProducts(String keyword) async {
    emit(Loading());
    try {
      final List<Product> productList = await searchProductsUseCase.invoke(keyword);
      if(productList.isNotEmpty) {
        emit(Loaded(products: productList));
      } else {
        emit(Empty(message: 'Product not found'));
      }
    } on Exception {
      emit(Error(message: 'Failed to load products list'));
    }
  }

}
