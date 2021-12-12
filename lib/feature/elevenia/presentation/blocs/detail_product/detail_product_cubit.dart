import 'package:bloc/bloc.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:elevenia_app/feature/elevenia/domain/usecases/get_detail_product_use_case.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/detail_product/detail_product_state.dart';

class DetailProductCubit extends Cubit<DetailProductState> {
  final GetDetailProductUseCase getDetailProductUseCase;

  DetailProductCubit({required this.getDetailProductUseCase}) : super(Init());

  Future<void> getDetailProduct(String productNumber) async {
    emit(Loading());
    try {
      final DetailProduct product = await getDetailProductUseCase.invoke(productNumber);
      if(product != null) {
        emit(Loaded(product: product));
      } else {
        emit(Error(message: 'Failed to load Product'));
      }
    } on Exception {
      emit(Error(message: 'Failed to load Product'));
    }
  }
}
