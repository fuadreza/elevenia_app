
import 'dart:ui';

import 'package:elevenia_app/core/theme/app_colors.dart';

class ColorUtil {
  static Color getRandomColor() {
    final List<Color> listColor = <Color>[
      AppColors.primaryDark,
      AppColors.greenDark,
      AppColors.blueDark,
      AppColors.orangeDark,
    ];

    return (listColor..shuffle()).first;
  }
}
