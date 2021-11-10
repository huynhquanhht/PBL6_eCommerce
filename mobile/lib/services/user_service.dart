import 'dart:convert';

import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/function/local_storage.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/models/UserUpdate.dart';

class UserService {
  UserService() {}

  // Future<Map<String, dynamic>> GetUserByToken() async {
  //   var url = "${SERVER_IP}/api/Users";
  //   var token = await getTokenStorage();
  //   var res = await http.get(
  //     Uri.parse(url),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     },
  //   );
  //   print('Response status: ${res.statusCode}');

  //   if (res.statusCode == 200) {
  //     return json.decode(res.body);
  //   } else {
  //     throw Exception("Failed to get current user!");
  //   }
  // }

  Future<UserUpdate> GetUserByToken() async {
    var url = "${SERVER_IP}/api/Users";
    var token = await getTokenStorage();
    var res = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print('Response status: ${res.statusCode}');

    if (res.statusCode == 200) {
      return UserUpdate.fromJson(json.decode(res.body));
    } else {
      throw Exception("Failed to get current user!");
    }
  }
}
