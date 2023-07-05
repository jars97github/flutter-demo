import 'package:dio/dio.dart';
var options = BaseOptions(
  baseUrl: "https://uat.proapp.api.tutenlabs.dev/",
  connectTimeout: 5000,
  receiveTimeout: 3000,
);
var dio = Dio(options);