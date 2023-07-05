import 'package:flutter_application_1/login/user_model.dart';

class MyService {

  static final MyService _instance = MyService._internal();
  factory MyService() => _instance;

  //initialize variables in here
  MyService._internal();

  late User _user;

  User get user => _user;

  void setUser(User value) => {
    _user = value
  };
}