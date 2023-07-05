
import 'package:flutter/material.dart';

class Constants{
  static const  navigationBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "About"),
    BottomNavigationBarItem(
        icon: Icon(Icons.grid_3x3_outlined), label: "Product"),
    BottomNavigationBarItem(
        icon: Icon(Icons.contact_mail), label: "Contact"),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: "Settings"),
  ];
}