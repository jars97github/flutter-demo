
import 'package:flutter/material.dart';
import './constants.dart';

class Welcome extends StatelessWidget{
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        child:
        Text(Constants.tags['WELCOME']!,style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold
        ),)
    );
  }

}