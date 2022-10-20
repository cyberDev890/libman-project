import 'dart:convert';

import 'package:get/get.dart';

class userProvider extends GetConnect {
  final url =
      "https://rayhan-firebase-34c0f-default-rtdb.asia-southeast1.firebasedatabase.app/";

// Post request
  Future<Response> postdata(String name, String password) {
    final body = json.encode({
      'nis': name,
      'password': password,

    });
    return post(url + "users.json", body);
  }
// Post request
  Future<Response> getdata(String name, String password) {
    final body = json.encode({
      'nis': name,
      'password': password,

    });
    return get(url + "users/$name.json",);
  }
  //delete data
  Future<Response> deletedata(String id) {
    return delete(url + "users/$id.json");
  }
  //update data
    Future<Response> editdata(String id,String name, String password) {
    final body = json.encode({
      'nis': name,
      'password': password,

    });
    return patch(url + "users/$id.json", body);
  }
}
