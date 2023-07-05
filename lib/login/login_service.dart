import 'package:dio/dio.dart';
import 'package:flutter_application_1/http/http.dart';
import 'package:flutter_application_1/login/user_model.dart';

class LoginService {
  static Future<User> login(String user, String password) async {
    try{
      var customHeaders = {
        'email': user,
        'password':password,
        'captcha':''
      };
      dio.options.headers.addAll(customHeaders);
      Response res = await dio.post("/user/login");
      return User.fromJson(res.data);
    }on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }
}