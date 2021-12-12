
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';

class ProductsTable {
  static final String tableName = 'products';
  static final String columnProductNumber = 'prdNo';
  static final String columnProductName = 'prdNm';
  static final String columnSellPrice = 'selPrc';

  static String create() {
    return "CREATE TABLE $tableName(" +
        "$columnProductNumber TEXT PRIMARY KEY," +
        "$columnProductName TEXT," +
        "$columnSellPrice TEXT"
        ")";
  }

  static Map<String, dynamic> toMap(Product product) => {
    columnProductNumber: product.productNumber,
    columnProductName: product.productName,
    columnSellPrice: product.sellPrice,
  };
}
