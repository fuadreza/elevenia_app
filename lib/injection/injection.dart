import 'package:elevenia_app/core/network/base_api_client.dart';
import 'package:elevenia_app/feature/elevenia/data/repositories/product_repository_impl.dart';
import 'package:elevenia_app/feature/elevenia/data/services/api/product_service.dart';
import 'package:elevenia_app/feature/elevenia/data/sources/remote/product_remote_data_source.dart';
import 'package:elevenia_app/feature/elevenia/data/sources/remote/product_remote_data_source_impl.dart';
import 'package:elevenia_app/feature/elevenia/domain/repositories/product_repository.dart';
import 'package:elevenia_app/feature/elevenia/domain/usecases/get_detail_product_use_case.dart';
import 'package:elevenia_app/feature/elevenia/domain/usecases/get_products_use_case.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/detail_product/detail_product_cubit.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/home/products_cubit.dart';
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

  //#endregion


  //#region REPOSITORY

  di.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: di(),
    ),
  );

  //#endregion


  //#region REMOTE DATA SOURCE

  di.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(
      service: di(),
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


  //#region CORE

  di.registerLazySingleton<BaseApiClient>(
        () => BaseApiClient(
      client: di(),
    ),
  );

  //#endregion


  //#region EXTERNAL

  di.registerLazySingleton(() => http.Client());

  //#endregion


}
