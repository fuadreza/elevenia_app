
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';

class DetailProductTable {
  static final String tableName = 'detail_product';
  static final String columnProductNumber = 'prdNo';
  static final String columnProductName = 'prdNm';
  static final String columnProductImage = 'prdImage01';
  static final String columnProductDescription = 'htmlDetail';
  static final String columnSellPrice = 'selPrc';

  static String create() {
    return "CREATE TABLE $tableName(" +
        "$columnProductNumber TEXT PRIMARY KEY," +
        "$columnProductName TEXT," +
        "$columnProductImage TEXT," +
        "$columnProductDescription TEXT," +
        "$columnSellPrice TEXT"
        ")";
  }

  static Map<String, dynamic> toMap(DetailProduct detailProduct) => {
    columnProductNumber: detailProduct.productNumber,
    columnProductName: detailProduct.productName,
    columnProductImage: detailProduct.productImage,
    columnProductDescription: detailProduct.productDescription,
    columnSellPrice: detailProduct.sellPrice,
  };
}
