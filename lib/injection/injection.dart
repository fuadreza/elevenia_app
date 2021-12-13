import 'package:elevenia_app/core/network/base_api_client.dart';
import 'package:elevenia_app/feature/elevenia/data/repositories/product_repository_impl.dart';
import 'package:elevenia_app/feature/elevenia/data/services/api/product_service.dart';
import 'package:elevenia_app/feature/elevenia/data/services/database/dao/cart_products_dao.dart';
import 'package:elevenia_app/feature/elevenia/data/services/database/dao/detail_product_dao.dart';
import 'package:elevenia_app/feature/elevenia/data/services/database/dao/products_dao.dart';
import 'package:elevenia_app/feature/elevenia/data/services/database/database_helper.dart';
import 'package:elevenia_app/feature/elevenia/data/sources/local/product_local_data_source.dart';
import 'package:elevenia_app/feature/elevenia/data/sources/local/product_local_data_source_impl.dart';
import 'package:elevenia_app/feature/elevenia/data/sources/remote/product_remote_data_source.dart';
import 'package:elevenia_app/feature/elevenia/data/sources/remote/product_remote_data_source_impl.dart';
import 'package:elevenia_app/feature/elevenia/domain/repositories/product_repository.dart';
import 'package:elevenia_app/feature/elevenia/domain/usecases/add_product_to_cart_use_case.dart';
import 'package:elevenia_app/feature/elevenia/domain/usecases/get_cart_products_use_case.dart';
import 'package:elevenia_app/feature/elevenia/domain/usecases/get_detail_product_use_case.dart';
import 'package:elevenia_app/feature/elevenia/domain/usecases/get_products_use_case.dart';
import 'package:elevenia_app/feature/elevenia/domain/usecases/remove_product_from_cart_use_case.dart';
import 'package:elevenia_app/feature/elevenia/domain/usecases/search_products_use_case.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/cart/cart_cubit.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/detail_product/detail_product_cubit.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/home/products_cubit.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/search/search_products_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final GetIt di = GetIt.instance;

Future<void> init() async {

  //! Features - Elevenia

  //#region BLOC

  di.registerFactory(
    () => ProductsCubit(
      getProductsUseCase: di(),
    ),
  );

  di.registerFactory(
    () => DetailProductCubit(
      getDetailProductUseCase: di(),
      addProductToCartUseCase: di(),
      removeProductFromCartUseCase: di(),
    ),
  );

  di.registerFactory(
    () => SearchProductsCubit(
      searchProductsUseCase: di(),
    ),
  );

  di.registerFactory(
    () => CartCubit(
      getCartProductsUseCase: di(),
    ),
  );

  //#endregion


  //#region USE CASE

  di.registerLazySingleton(
    () => GetProductsUseCase(
      repository: di(),
    ),
  );

  di.registerLazySingleton(
    () => GetDetailProductUseCase(
      repository: di(),
    ),
  );

  di.registerLazySingleton(
    () => SearchProductsUseCase(
      repository: di(),
    ),
  );

  di.registerLazySingleton(
    () => GetCartProductsUseCase(
      repository: di(),
    ),
  );

  di.registerLazySingleton(
    () => AddProductToCartUseCase(
      repository: di(),
    ),
  );

  di.registerLazySingleton(
    () => RemoveProductFromCartUseCase(
      repository: di(),
    ),
  );

  //#endregion


  //#region REPOSITORY

  di.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: di(),
      localDataSource: di(),
    ),
  );

  //#endregion


  //#region DATA SOURCE

  di.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(
      service: di(),
    ),
  );

  di.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(
      productsDao: di(),
      detailProductDao: di(),
      cartProductsDao: di(),
    ),
  );

  //#endregion


  //#region SERVICE

  di.registerLazySingleton<ProductService>(
    () => ProductService(
      apiClient: di(),
    ),
  );

  //#endregion


  //#region DAO

  di.registerLazySingleton<ProductsDao>(
    () => ProductsDao(
      databaseHelper: di(),
    ),
  );

  di.registerLazySingleton<DetailProductDao>(
    () => DetailProductDao(
      databaseHelper: di(),
    ),
  );

  di.registerLazySingleton<CartProductsDao>(
    () => CartProductsDao(
      databaseHelper: di(),
    ),
  );

  //#endregion


  //#region CORE

  di.registerLazySingleton<BaseApiClient>(
    () => BaseApiClient(
      client: di(),
    ),
  );

  di.registerLazySingleton<DatabaseHelper>(
    () => DatabaseHelper(),
  );

  //#endregion


  //#region EXTERNAL

  di.registerLazySingleton(() => http.Client());

  //#endregion


}
