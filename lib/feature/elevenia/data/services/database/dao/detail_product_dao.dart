
import 'package:elevenia_app/feature/elevenia/data/models/remote/detail_product/detail_product_model.dart';
import 'package:elevenia_app/feature/elevenia/data/models/remote/product/product_model.dart';
import 'package:elevenia_app/feature/elevenia/data/services/database/database_helper.dart';
import 'package:elevenia_app/feature/elevenia/data/services/database/table/detail_product_table.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:sqflite/sqflite.dart';

class DetailProductDao {
  final DatabaseHelper databaseHelper;

  DetailProductDao({required this.databaseHelper});

  Future<void> insert(DetailProduct detailProduct) async {
    final Database? db = await databaseHelper.database;
    try {
      await db?.insert(DetailProductTable.tableName, DetailProductTable.toMap(detailProduct),
          conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } on Exception catch (e) {}
  }

  Future<void> remove(DetailProduct detailProduct) async {
    final Database? db = await databaseHelper.database;
    try {
      await db?.delete(
        DetailProductTable.tableName,
        where: '${DetailProductTable.columnProductNumber} = ?',
        whereArgs: <String>[detailProduct.productNumber],
      );
    } on Exception catch (e) {}
  }

  Future<DetailProduct?> getDetailProduct(String productNumber) async {
    final Database? db = await databaseHelper.database;
    final List<Map<String, dynamic>>? results = await db?.query(
      DetailProductTable.tableName,
      columns: [
        DetailProductTable.columnProductNumber,
        DetailProductTable.columnProductName,
        DetailProductTable.columnProductImage,
        DetailProductTable.columnProductDescription,
        DetailProductTable.columnSellPrice,
      ],
      where: '${DetailProductTable.columnProductNumber} = ?',
      whereArgs: <String>[productNumber],
    );

    if (results!.isNotEmpty) {
      final List<DetailProduct> products = results.map((Map<String, dynamic> data) => DetailProductModel.fromJson(data)).toList();
      return products.first;
    } else {
      return null;
    }
  }
}
