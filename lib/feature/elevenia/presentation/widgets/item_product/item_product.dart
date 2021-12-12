
import 'package:elevenia_app/core/extensions/string_extension.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemProduct extends StatelessWidget {
  final Product product;
  final VoidCallback? onItemPressed;

  const ItemProduct({
    Key? key,
    required this.product,
    this.onItemPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemPressed,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Icon(
                  Icons.shopping_bag,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productNumber,
                      ),
                      Text(
                        product.productName,
                      ),
                      Text(
                        product.sellPrice.toRupiahFormat(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
