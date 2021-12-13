
import 'package:elevenia_app/core/extensions/string_extension.dart';
import 'package:elevenia_app/core/theme/app_colors.dart';
import 'package:elevenia_app/core/utils/icon_util.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatelessWidget {
  final DetailProduct detailProduct;
  final VoidCallback? onItemPressed;

  const ItemCart({
    Key? key,
    required this.detailProduct,
    this.onItemPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemPressed,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 0.5,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    detailProduct.productImage,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if(loadingProgress == null) {
                        return child;
                      } else {
                        return Icon(
                          Icons.image,
                        );
                      }
                    },
                    fit: BoxFit.fill,
                    errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                      return Icon(
                        IconUtil.getRandomIcon(),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detailProduct.productNumber,
                      style: TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      detailProduct.productName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      detailProduct.sellPrice.toRupiahFormat(),
                      style: TextStyle(
                        color: AppColors.danger,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
