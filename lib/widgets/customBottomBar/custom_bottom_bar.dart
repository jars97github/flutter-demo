import 'package:flutter/material.dart';
import './constants.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.blue,
      ),child: BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => onTap(index),
      iconSize: 30,
      elevation: 5,
      selectedItemColor: Colors.black,
      items:  Constants.navigationBarItems,
    ),
    );
  }



}