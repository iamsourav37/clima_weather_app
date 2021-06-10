import 'dart:convert';
// import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper({required this.url});

  Future getData() async {
    var response;
    try {
      response = await http.get(Uri.parse(this.url));
      return jsonDecode(response.body);
    } catch (e) {
      print("Error: $e");
    }
  }
}
