import 'package:elevenia_app/feature/elevenia/presentation/pages/cart/cart_page.dart';
import 'package:elevenia_app/feature/elevenia/presentation/pages/detail_product/detail_product_page.dart';
import 'package:elevenia_app/feature/elevenia/presentation/pages/home/home_page.dart';
import 'package:elevenia_app/feature/elevenia/presentation/pages/products/products_page.dart';
import 'package:elevenia_app/feature/elevenia/presentation/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const String ROUTE_HOME_PAGE = '/';
const String ROUTE_PRODUCTS_PAGE = 'products';
const String ROUTE_SEARCH_PAGE = 'search';
const String ROUTE_CART_PAGE = 'cart';
const String ROUTE_DETAIL_PRODUCT_PAGE = 'detailproduct';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ROUTE_HOME_PAGE:
      return MaterialPageRoute(builder: (BuildContext context) => HomePage());
    case ROUTE_PRODUCTS_PAGE:
      return MaterialPageRoute(builder: (BuildContext context) => ProductsPage());
    case ROUTE_SEARCH_PAGE:
      return MaterialPageRoute(builder: (BuildContext context) => SearchPage());
    case ROUTE_CART_PAGE:
      return MaterialPageRoute(builder: (BuildContext context) => CartPage());
    case ROUTE_DETAIL_PRODUCT_PAGE:
      final String productNumber = settings.arguments as String;
      return MaterialPageRoute(builder: (BuildContext context) => DetailProductPage(productNumber: productNumber));
    default:
      return MaterialPageRoute(builder: (BuildContext context) => HomePage());
  }
}
