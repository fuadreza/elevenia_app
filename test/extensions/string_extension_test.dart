
import 'package:elevenia_app/core/extensions/string_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return rupiah format string', () {
    // arrange
    const String productPrice = '100000';

    // act
    final String productPriceFormated = productPrice.toRupiahFormat();

    // assert
    const String expectedProductPrice = 'Rp100.000,00';
    expect(productPriceFormated, expectedProductPrice);
  });
}
