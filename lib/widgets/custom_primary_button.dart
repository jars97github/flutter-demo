import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';

class CustomPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final bool isDisabled;
  const CustomPrimaryButton(
      {super.key,
        required this.onPressed,
        required this.buttonText,
        required this.isDisabled}
      );

  @override
  Widget build(BuildContext context) {
    return Center (
        child: ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
              disabledBackgroundColor: MyColors.blue.withOpacity(0.4),
            minimumSize: const Size.fromHeight(50),
          ),
          child: Text(buttonText,style: const TextStyle(
              color: Colors.white,
              fontSize: 18
          ),),
        )
    );
  }
  
}