
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';
import 'package:equatable/equatable.dart';

abstract class SearchProductsState extends Equatable {
  
  @override
  List<Object?> get props => <Object?>[];
  
}

class Init extends SearchProductsState {}

class Loading extends SearchProductsState {}

class Empty extends SearchProductsState {
  final String message;

  Empty({required this.message});

  @override
  List<Object?> get props => <Object?>[message];
}

class Error extends SearchProductsState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => <Object?>[message];
}

class Loaded extends SearchProductsState {
  final List<Product> products;

  Loaded({required this.products});

  @override
  List<Object?> get props => <Object?>[products];

}
