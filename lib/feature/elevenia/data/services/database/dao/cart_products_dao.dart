
import 'package:elevenia_app/feature/elevenia/data/models/remote/detail_product/detail_product_model.dart';
import 'package:elevenia_app/feature/elevenia/data/services/database/database_helper.dart';
import 'package:elevenia_app/feature/elevenia/data/services/database/table/cart_products_table.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:sqflite/sqflite.dart';

class CartProductsDao {
  final DatabaseHelper databaseHelper;

  CartProductsDao({required this.databaseHelper});

  Future<void> insert(DetailProduct detailProduct) async {
    final Database? db = await databaseHelper.database;
    try {
      await db?.insert(CartProductsTable.tableName, CartProductsTable.toMap(detailProduct),
          conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } on Exception catch (e) {}
  }

  Future<void> remove(DetailProduct detailProduct) async {
    final Database? db = await databaseHelper.database;
    try {
      await db?.delete(
        CartProductsTable.tableName,
        where: '${CartProductsTable.columnProductNumber} = ?',
        whereArgs: <String>[detailProduct.productNumber],
      );
    } on Exception catch (e) {}
  }

  Future<List<DetailProduct>> getCartProducts() async {
    final Database? db = await databaseHelper.database;
    final List<Map<String, dynamic>>? results = await db?.query(
      CartProductsTable.tableName,
      columns: [
        CartProductsTable.columnProductNumber,
        CartProductsTable.columnProductName,
        CartProductsTable.columnProductImage,
        CartProductsTable.columnProductDescription,
        CartProductsTable.columnSellPrice,
      ],
    );

    if (results!.isNotEmpty) {
      return results.map((Map<String, dynamic> data) => DetailProductModel.fromJson(data)).toList();
    }

    return <DetailProduct>[];
  }
}
