
import 'package:elevenia_app/core/extensions/string_extension.dart';
import 'package:elevenia_app/core/theme/app_colors.dart';
import 'package:elevenia_app/core/utils/color_util.dart';
import 'package:elevenia_app/core/utils/icon_util.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';
import 'package:elevenia_app/feature/elevenia/presentation/widgets/chip/simple_chip.dart';
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        elevation: 0.5,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: Icon(
                      IconUtil.getRandomIcon(),
                      size: 50,
                    ),
                  ),
                ),
              ),
              Wrap(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          product.productNumber,
                          style: TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(height: 4),
                        SimpleChip(
                          text: product.categoryName,
                          textSize: 10,
                          backgroundColor: ColorUtil.getRandomColor(),
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 4),
                        Text(
                          product.productName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          product.sellPrice.toRupiahFormat(),
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
            ],
          ),
        ),
      ),
    );
  }
}
