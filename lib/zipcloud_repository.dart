import 'dart:convert';

import 'package:http/http.dart' as http;

class ZipcloudRepository {
  static Future<String> fetchAddress(String zipcode) async {
    final response = await http.get(
        Uri.parse('https://zipcloud.ibsnet.co.jp/api/search?zipcode=$zipcode'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> map = jsonDecode(response.body)['results'][0];
      return '${map['address1']}${map['address2']}${map['address3']}';
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load address');
    }
  }
}
