import 'dart:io';

final ConnectivityUtil connectivity = ConnectivityUtil.instance;

class ConnectivityUtil {
  static final ConnectivityUtil _instance = ConnectivityUtil();

  static ConnectivityUtil get instance => _instance;

  bool isConnected = false;

  Future<void> init() async {
    try {
      final List<InternetAddress> result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_) {
      isConnected = false;
    }
  }
}
