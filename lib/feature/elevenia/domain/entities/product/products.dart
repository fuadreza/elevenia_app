
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';
import 'package:equatable/equatable.dart';

class Products extends Equatable {
  final List<Product> products;

  const Products({
    required this.products,
  });

  @override
  List<Object?> get props => <Object?>[products];
}
