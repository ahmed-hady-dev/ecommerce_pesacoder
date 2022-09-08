import 'package:flutter/material.dart';

import '../../constants.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final Color color;

  final Function()? onPress;

  CustomButton({
    required this.onPress,
    this.text = 'Write text ',
    this.color = Constants.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.all(18),
        primary: color,
        elevation: 0.0,
      ),
      onPressed: onPress,
      child: CustomText(
        alignment: Alignment.center,
        text: text,
        color: Colors.white,
      ),
    );
  }
}
