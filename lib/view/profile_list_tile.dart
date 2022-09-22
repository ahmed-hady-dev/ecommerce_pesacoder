import 'package:ecommerce_pesacoder/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    required this.text,
    required this.imagePath,
    required this.iconData,
    key,
    this.onPressed,
  }) : super(key: key);
  final String text;
  final String imagePath;
  final IconData iconData;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: ListTile(
        title: CustomText(text: text),
        leading: Image.asset(imagePath),
        trailing: Icon(iconData, color: Colors.black),
      ),
    );
  }
}
