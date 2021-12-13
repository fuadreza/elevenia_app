
import 'package:equatable/equatable.dart';

class DetailProduct extends Equatable {
  final String productName;
  final String productNumber;
  final String productImage;
  final String productDescription;
  final String sellPrice;
  final int cartQuantity;

  const DetailProduct({
    required this.productName,
    required this.productNumber,
    required this.productImage,
    required this.productDescription,
    required this.sellPrice,
    required this.cartQuantity,
  });

  @override
  List<Object?> get props => <Object?>[productName, productNumber, productImage, productDescription, sellPrice, cartQuantity];
}
