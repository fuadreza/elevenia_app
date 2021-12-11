import 'package:elevenia_app/core/error/exceptions.dart';
import 'package:http/http.dart' as http;

class BaseApiClient {
  final http.Client client;
  final String _baseUrl = 'api.elevenia.co.id/rest';

  BaseApiClient({required this.client});

  Future<String> get({
    required String url,
    Map<String, dynamic>? params,
    String? path,
  }) async {
    final Uri uri = params == null
        ? path == null
            ? Uri.https(_baseUrl, url)
            : Uri.https(_baseUrl, url + path)
        : path == null
            ? Uri.https(_baseUrl, url, params)
            : Uri.https(_baseUrl, url + path, params);

    try {
      final Map<String, String> headers = <String, String>{
        'Content-Type': 'application/json',
      };

      final http.Response response = await client.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }
}
