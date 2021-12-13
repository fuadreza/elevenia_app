
import 'dart:ui';

import 'package:elevenia_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class IconUtil {
  static IconData getRandomIcon() {
    final List<IconData> listIcon = <IconData>[
      Icons.shopping_bag,
      Icons.shopping_bag_outlined,
      Icons.shopping_basket_outlined,
    ];

    return (listIcon..shuffle()).first;
  }
}
