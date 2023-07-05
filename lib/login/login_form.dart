import 'package:flutter/material.dart';
import 'package:flutter_application_1/login/constants.dart';
import 'package:flutter_application_1/login/welcome.dart';
import 'package:flutter_application_1/login/welcome2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/custom_primary_button.dart';
import '../providers.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

 
  @override
  Widget build(BuildContext context,WidgetRef ref) {

    const textStyle = TextStyle(fontSize: 14, fontFamily: 'Monserrat');

    var model =ref.read(loginProvider);
    var watch = ref.watch(loginProvider);

    FocusNode node1 = model.node1;
    FocusNode node2 = model.node2;

    node1.addListener(() {
      if (!node1.hasFocus){
        ref.read(loginProvider).validateUser(context,model.mUser.text);
      }
    });

    return
      Container(
          margin: const EdgeInsets.only(left: 50, right: 50),
          child:Form(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Welcome(),
                    const Welcome2(),
                    Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                      child:  TextFormField(
                          focusNode: node1,
                          controller: model.mUser,
                          obscureText: false,
                          onChanged: (value) => {model.onChangeUser(context,value)},
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.person),
                              labelText: Constants.tags['EMAIL'],
                              border:const OutlineInputBorder(),
                              labelStyle: textStyle)),),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                      child:TextFormField(
                          focusNode: node2,
                          controller: model.mPassword,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          onChanged:(value) => {model.onChangePassword(context, value)},
                          onFieldSubmitted: (value) => {model.onPasswordSubmitted(context, value)},
                          decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.lock),
                              labelText: Constants.tags['PASSWORD'],
                              border: const OutlineInputBorder(),
                              labelStyle: textStyle)),),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                        constraints: const BoxConstraints(
                          minWidth: double.infinity,
                        ),
                        child:CustomPrimaryButton(
                                onPressed: () => {model.onPressInitSession(context)},
                                buttonText: Constants.tags['INIT_SESSION']!,
                                isDisabled: watch.isDisabled)
                        )

                  ]))
      );

  }




}