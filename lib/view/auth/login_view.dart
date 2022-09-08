import 'package:ecommerce_pesacoder/constants.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_button.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_button_social.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_text.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          right: 16.0,
          left: 16.0,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomText(
                  text: 'Welcome,',
                  color: Colors.black,
                  fontSize: 30.0,
                ),
                CustomText(
                  text: 'SignUp',
                  color: Constants.primaryColor,
                  fontSize: 18.0,
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomText(
              text: 'Sign in to Continue',
              color: Colors.grey,
              fontSize: 14.0,
            ),
            const SizedBox(height: 30.0),
            Column(
              children: <Widget>[
                CustomTextFormField(
                  text: 'Email',
                  hint: 'iamdavid@gmail.com',
                  onSave: (value) {},
                  validator: (vale) {},
                ),
                const SizedBox(height: 40.0),
                CustomTextFormField(
                  text: 'Password',
                  hint: '**********',
                  onSave: (value) {},
                  validator: (vale) {},
                ),
                const SizedBox(height: 20.0),
                CustomText(
                  text: 'Forget Password?',
                  fontSize: 14.0,
                  alignment: Alignment.topRight,
                ),
                const SizedBox(height: 20.0),
                CustomButton(
                  text: 'SIGN IN',
                  onPress: () {},
                ),
                const SizedBox(height: 20.0),
                CustomText(
                  text: '-OR-',
                  fontSize: 14.0,
                  alignment: Alignment.center,
                ),
                const SizedBox(height: 40.0),
                CustomButtonSocial(
                  text: 'Sign in with Facebook',
                  imageName: 'assets/images/facebook.png',
                  onPress: () {},
                ),
                const SizedBox(height: 40.0),
                CustomButtonSocial(
                  text: 'Sign in with Google',
                  imageName: 'assets/images/google.png',
                  onPress: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
