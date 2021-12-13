
import 'package:elevenia_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SimpleChip extends StatelessWidget {

  final String text;
  final Color? borderColor;
  final double borderRadius;
  final Color textColor;
  final double textSize;
  final FontWeight fontWeight;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;

  const SimpleChip({
    Key? key,
    required this.text,
    this.borderColor,
    this.borderRadius = 20,
    this.textColor = AppColors.white,
    this.textSize = 12,
    this.fontWeight = FontWeight.normal,
    this.backgroundColor = AppColors.danger,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: backgroundColor,
      ),
      child: Text(
        text.isNotEmpty ? text : 'Sample',
        style: TextStyle(
          fontSize: textSize,
          color: textColor,
          fontWeight: fontWeight,
        ),
      ),
    );
  }

}
