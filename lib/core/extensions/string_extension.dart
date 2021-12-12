import 'package:intl/intl.dart';

extension StringExtensions on String {
  String toRupiahFormat() {
    final NumberFormat formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');

    return formatCurrency.format(int.parse(this));
  }
}
