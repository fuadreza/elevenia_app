
import 'package:elevenia_app/core/network/base_api_client.dart';
import 'package:elevenia_app/feature/elevenia/data/services/api/product_api_url.dart';

class ProductService {
  final BaseApiClient apiClient;

  ProductService({required this.apiClient});

  Future<String> getProducts(String pageNumber) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'page': pageNumber
    };
    return apiClient.get(url: ProductApiUrl.URL_PRODUCT_LIST, params: params);
  }
}
