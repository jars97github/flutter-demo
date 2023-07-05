
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/home.dart';
import 'package:flutter_application_1/login/login_service.dart';
import 'package:flutter_application_1/login/user_model.dart';
import 'package:flutter_application_1/utils/my_service.dart';
import './constants.dart';

class LoginViewModel extends ChangeNotifier{
  final MyService _myService = MyService();
  bool isDisabled = true;
  bool isEmailValid = false;
  bool isPasswordValid = false;
  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  final mUser = TextEditingController();
  final mPassword = TextEditingController();


  void onPressInitSession(context) async {
    await LoginService.login(mUser.text,mPassword.text).then((value) =>
    {
      saveUserInfo(value,context)
    }).catchError((e) => {
      showMessage(context, e.toString())
    });
  }

  void saveUserInfo(User value,context){
    _myService.setUser(value);
    goToHome(context);
  }

  void showMessage(BuildContext context,String message){
    SnackBar snackBar =  SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    notifyListeners();
  }

  void goToHome(context){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const Home()));
  }

  void onChangeUser(context,value){
    if (value.isEmpty) {
      FocusScope.of(context).requestFocus(node1);
      showMessage(context,Constants.tags['MANDATORY_EMAIL']!);
    }
  }

  void validateUser(context,value){
    isEmailValid = false;
    if (value.isEmpty) {
      FocusScope.of(context).requestFocus(node1);
      showMessage(context,Constants.tags['MANDATORY_EMAIL']!);
    } else if (!RegExp(
        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(value)) {
      FocusScope.of(context).requestFocus(node1);
      showMessage(context,Constants.tags['WRONG_EMAIL']!);

    } else {
      isEmailValid = true;
    }
  }

  void onChangePassword(context,value) {
    validatePassword(context,value);
  }

  void validatePassword(context,value){
    isPasswordValid = false;
    if (value.isEmpty) {
      FocusScope.of(context).requestFocus(node2);
      showMessage(context,Constants.tags['MANDATORY_PASSWORD']!);
    } else {
      isPasswordValid = true;
    }
  }

  void onPasswordSubmitted(context,value){
    validatePassword(context,value);
    if (isPasswordValid && isEmailValid) {
      isDisabled=false;
    }else{
      isDisabled=true;
    }
    notifyListeners();
  }

  void onPressed(context){
    SnackBar snackBar =  const SnackBar(content: Text("OnPressed"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    isDisabled=true;
    notifyListeners();
  }
}