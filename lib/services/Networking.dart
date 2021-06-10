import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper({required this.url});

  Future getData() async {
    try {
      var response = await http.get(Uri.parse(this.url));
      return jsonDecode(response.body);
    } catch (e) {
      print("error : $e");
    }
  }
}
