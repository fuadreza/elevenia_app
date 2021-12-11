
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';
import 'package:equatable/equatable.dart';

abstract class ProductsState extends Equatable {
  
  @override
  List<Object?> get props => <Object?>[];
  
}

class Init extends ProductsState {}

class Loading extends ProductsState {}

class Error extends ProductsState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => <Object?>[message];
}

class Loaded extends ProductsState {
  final List<Product> products;

  Loaded({required this.products});

  @override
  List<Object?> get props => <Object?>[products];

}
