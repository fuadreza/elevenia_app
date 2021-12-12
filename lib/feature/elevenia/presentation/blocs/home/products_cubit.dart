import 'package:bloc/bloc.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';
import 'package:elevenia_app/feature/elevenia/domain/usecases/get_products_use_case.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/home/products_state.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GetProductsUseCase getProductsUseCase;
  List<Product> products = <Product>[];

  ProductsCubit({required this.getProductsUseCase}) : super(Init());

  Future<void> getProducts(int pageNumber) async {
    emit(Loading());
    try {
      final List<Product> productList = await getProductsUseCase.invoke(pageNumber.toString());
      products.addAll(productList);
      if(products.isNotEmpty) {
        emit(Loaded(products: products));
      } else {
        emit(Error(message: 'Product empty'));
      }
    } on Exception {
      emit(Error(message: 'Failed to load products list'));
    }
  }

  Future<List<Product>> getProductsByPage(int pageNumber) async {
      try {
        final List<Product> productList = await getProductsUseCase.invoke(pageNumber.toString());
        return productList;
      } on Exception {
        return <Product>[];
      }
  }
}
