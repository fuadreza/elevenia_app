
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
  
  @override
  List<Object?> get props => <Object?>[];
  
}

class Init extends CartState {}

class Loading extends CartState {}

class Error extends CartState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => <Object?>[message];
}

class Loaded extends CartState {
  final List<DetailProduct> products;

  Loaded({required this.products});

  @override
  List<Object?> get props => <Object?>[products];

}
