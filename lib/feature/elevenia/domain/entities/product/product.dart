
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String productName;
  final String productNumber;
  final String sellQuantity;
  final String sellPrice;
  final String categoryName;

  const Product({
    required this.productName,
    required this.productNumber,
    required this.sellQuantity,
    required this.sellPrice,
    required this.categoryName,
  });

  @override
  List<Object?> get props => <Object?>[productName, productNumber, sellQuantity, sellPrice, categoryName];
}
