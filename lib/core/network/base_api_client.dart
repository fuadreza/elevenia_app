import 'dart:developer';

import 'package:elevenia_app/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class BaseApiClient {
  final http.Client client;
  final Xml2Json xml2Json = Xml2Json();
  final String _apiKey = '721407f393e84a28593374cc2b347a98';
  final String _baseUrl = 'api.elevenia.co.id';

  BaseApiClient({required this.client});

  Future<String> get({
    required String url,
    Map<String, dynamic>? params,
    String? path,
  }) async {
    final Uri uri = params == null
        ? path == null
            ? Uri.http(_baseUrl, url)
            : Uri.http(_baseUrl, url + path)
        : path == null
            ? Uri.http(_baseUrl, url, params)
            : Uri.http(_baseUrl, url + path, params);

    try {
      final Map<String, String> headers = <String, String>{
        'Content-Type': 'application/xml',
        'openapikey': _apiKey,
      };

      final http.Response response = await client.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        xml2Json.parse(response.body);
        return xml2Json.toParker();
      } else {
        throw ServerException();
      }
    } on Exception {
      print('Error server');
      throw ServerException();
    }
  }

}
