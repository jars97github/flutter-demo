import 'package:flutter/material.dart';

import './constants.dart';

class CustomDrawer extends StatelessWidget{
  const CustomDrawer({super.key, required this.user, required this.email});
  final String user;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
      children: <Widget>[
          UserAccountsDrawerHeader(
          accountName:  Text(user),
          accountEmail: Text(email,style:const TextStyle(
              fontSize: 12
          ),),
          currentAccountPicture: const CircleAvatar(
            child: FlutterLogo(size: 42.0),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title:  Text(Constants.tags['PROFILE']!),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
            leading: const Icon(Icons.exit_to_app,color: Colors.red),
            title:  Text(Constants.tags['CLOSE_SESSION']!),
            onTap: (){

            }
        )
      ],
    ),
    );
  }
  
}
