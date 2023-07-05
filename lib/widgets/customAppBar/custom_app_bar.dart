import 'package:flutter/material.dart';

import './constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title:  Text(Constants.tags['TITLE']!)
    );
  }

}