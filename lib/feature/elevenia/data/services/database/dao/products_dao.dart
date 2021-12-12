
import 'package:elevenia_app/feature/elevenia/data/models/remote/product/product_model.dart';
import 'package:elevenia_app/feature/elevenia/data/services/database/database_helper.dart';
import 'package:elevenia_app/feature/elevenia/data/services/database/table/products_table.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';
import 'package:sqflite/sqflite.dart';

class ProductsDao {
  final DatabaseHelper databaseHelper;

  ProductsDao({required this.databaseHelper});

  Future<void> insert(Product product) async {
    final Database? db = await databaseHelper.database;
    try {
      await db?.insert(ProductsTable.tableName, ProductsTable.toMap(product),
          conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } on Exception catch (e) {}
  }

  Future<void> remove(Product product) async {
    final Database? db = await databaseHelper.database;
    try {
      await db?.delete(
        ProductsTable.tableName,
        where: '${ProductsTable.columnProductNumber} = ?',
        whereArgs: <String>[product.productNumber],
      );
    } on Exception catch (e) {}
  }

  Future<List<Product>> getProducts() async {
    final Database? db = await databaseHelper.database;
    final List<Map<String, dynamic>>? results = await db?.query(
      ProductsTable.tableName,
      columns: [
        ProductsTable.columnProductNumber,
        ProductsTable.columnProductName,
        ProductsTable.columnSellPrice,
      ],
    );

    if (results!.isNotEmpty) {
      return results.map((Map<String, dynamic> data) => ProductModel.fromJson(data)).toList();
    }

    return <Product>[];
  }
}
