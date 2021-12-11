
import 'package:flutter/widgets.dart';

@immutable
class ProductApiUrl {
  static const String BASE_SERVER_ENV = '/rest';

  static const String CONTROLLER_PRODUCT = '$BASE_SERVER_ENV/prodservices';
  static const String URL_PRODUCT_LIST = '$CONTROLLER_PRODUCT/product/listing';
}
