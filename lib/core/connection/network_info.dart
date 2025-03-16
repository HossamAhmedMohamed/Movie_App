import 'package:http/http.dart' as http;

class NetworkInfo {
  Future<bool> get isConnected async {
    try {
      final response = await http
          .get(Uri.parse('https://www.google.com'))
          .timeout(Duration(seconds: 3));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
