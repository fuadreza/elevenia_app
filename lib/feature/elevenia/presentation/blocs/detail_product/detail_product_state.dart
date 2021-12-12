
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:equatable/equatable.dart';

abstract class DetailProductState extends Equatable {
  
  @override
  List<Object?> get props => <Object?>[];
  
}

class Init extends DetailProductState {}

class Loading extends DetailProductState {}

class Error extends DetailProductState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => <Object?>[message];
}

class Loaded extends DetailProductState {
  final DetailProduct product;

  Loaded({required this.product});

  @override
  List<Object?> get props => <Object?>[product];

}
