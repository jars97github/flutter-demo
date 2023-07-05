
import 'package:flutter/material.dart';
import './constants.dart';

class Welcome2 extends StatelessWidget{
  const Welcome2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        child:
        Text(Constants.tags['WELCOME2']!,style: const TextStyle(
            fontSize: 18
        ),)
    );
  }

}