import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';
import 'package:elevenia_app/feature/elevenia/presentation/widgets/item_product/item_product.dart';

final product = Product(
  productNumber: '123',
  productName: 'Product name',
  sellQuantity: '100',
  sellPrice: '10000',
  categoryName: 'Clothes',
);

Widget createItemProduct() => MaterialApp(
  home: Container(
    child: ItemProduct(
      product: product,
    ),
  ),
);

void main() {
  group('Item Product test', () {
    testWidgets('Testing if Icon shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createItemProduct());
      expect(find.byType(Icon), findsOneWidget);
    });

    testWidgets('Testing if Text shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createItemProduct());
      expect(find.byType(Text), findsNWidgets(4));
    });
  });
}