
import 'package:elevenia_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final ValueChanged<String>? onSubmit;

  SearchBar({this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.grey),
      ),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        onFieldSubmitted: onSubmit,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: 'Search product',
        ),
      ),
    );
  }
}