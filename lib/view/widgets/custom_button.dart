import 'package:flutter/material.dart';

import '../../constants.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final Color color;

  final Function()? onPress;

  const CustomButton({
    Key? key,
    required this.onPress,
    this.text = 'Write text ',
    this.color = Constants.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        padding: const EdgeInsets.all(18),
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
