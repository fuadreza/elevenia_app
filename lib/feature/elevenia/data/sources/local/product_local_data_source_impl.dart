
import 'package:elevenia_app/feature/elevenia/data/services/database/dao/products_dao.dart';
import 'package:elevenia_app/feature/elevenia/data/sources/local/product_local_data_source.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final ProductsDao productsDao;

  ProductLocalDataSourceImpl({required this.productsDao});

  @override
  Future<List<Product>> getProducts() async {
    try {
      return await productsDao.getProducts();
    } on Error {
      throw Exception();
    }
  }

  @override
  Future<void> saveProducts(List<Product> products) async {
    try {
      products.forEach((Product product) async {
        return await productsDao.insert(product);
      });
    } on Error {
      throw Exception();
    }
  }

}
