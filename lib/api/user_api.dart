import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_initializartion/api/http_service.dart';
import 'package:flutter_initializartion/model/user.dart';
import 'package:flutter_initializartion/response/login_response.dart';
import 'package:flutter_initializartion/utils/url.dart';

class UserAPI {
  //Register API
  Future<bool> registerUser(User user) async {
    bool isSignup = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.post(
        url,
        data: user.toJson(),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isSignup;
  }

  //Login API
  Future<bool> loginUser(String email, String password) async {
    bool isLogin = false;
    try {
      var url = baseUrl + loginUrl;
      var dio = HttpServices().getDioInstance();
      Response response = await dio.post(
        url,
        data: {
          "email": email,
          "password": password,
        },
      );
      // print("ygasjhgdjhgaskhdgkjsahdjsahjhdhkjasdkj");
      // debugPrint("lllll${response.data}");
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        token = loginResponse.data!.token;
        if (token != null) {
          isLogin = true;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }
}
