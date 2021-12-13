
import 'package:elevenia_app/feature/elevenia/data/services/database/dao/cart_products_dao.dart';
import 'package:elevenia_app/feature/elevenia/data/services/database/dao/detail_product_dao.dart';
import 'package:elevenia_app/feature/elevenia/data/services/database/dao/products_dao.dart';
import 'package:elevenia_app/feature/elevenia/data/sources/local/product_local_data_source.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final ProductsDao productsDao;
  final DetailProductDao detailProductDao;
  final CartProductsDao cartProductsDao;

  ProductLocalDataSourceImpl({
    required this.productsDao,
    required this.detailProductDao,
    required this.cartProductsDao,
  });

  @override
  Future<List<Product>> getProducts() async {
    try {
      return await productsDao.getProducts();
    } on Error {
      throw Exception();
    }
  }

  @override
  Future<DetailProduct> getDetailProduct(String productNumber) async {
    try {
      final DetailProduct? detailProduct = await detailProductDao.getDetailProduct(productNumber);
      if(detailProduct != null) {
        return detailProduct;
      } else {
        throw Exception();
      }
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

  @override
  Future<void> saveDetailProduct(DetailProduct detailProduct) async {
    try {
      return await detailProductDao.insert(detailProduct);
    } on Error {
      throw Exception();
    }
  }


  @override
  Future<List<DetailProduct>> getCartProducts() async {
    try {
      return await cartProductsDao.getCartProducts();
    } on Error {
      throw Exception();
    }
  }

  @override
  Future<void> addProductToCart(DetailProduct detailProduct) async {
    try {
      return await cartProductsDao.insert(detailProduct);
    } on Error {
      throw Exception();
    }
  }

  @override
  Future<void> removeProductFromCart(DetailProduct detailProduct) async {
    try {
      return await cartProductsDao.remove(detailProduct);
    } on Error {
      throw Exception();
    }
  }
}
