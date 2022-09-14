import 'package:ecommerce_pesacoder/constants.dart';
import 'package:ecommerce_pesacoder/core/view_model/auth_view_model.dart';
import 'package:ecommerce_pesacoder/helper/firebase_auth_helper.dart';
import 'package:ecommerce_pesacoder/view/auth/register_view.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_button.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_button_social.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_text.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print('FirebaseAuthHelper.auth.currentUser =  ${FirebaseAuthHelper.auth.currentUser}');
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
        child: SingleChildScrollView(
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
                  TextButton(
                      onPressed: () => Get.to(() => RegisterView()),
                      child: CustomText(
                        text: 'SignUp',
                        color: Constants.primaryColor,
                        fontSize: 18.0,
                      )),
                ],
              ),
              const SizedBox(height: 10),
              CustomText(
                text: 'Sign in to Continue',
                color: Colors.grey,
                fontSize: 14.0,
              ),
              const SizedBox(height: 30.0),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    CustomTextFormField(
                      text: 'Email',
                      hint: 'iamdavid@gmail.com',
                      onSave: (value) {
                        controller.email = value;
                        print('email value' + value!);
                        print(value);
                      },
                      validator: (value) {
                        if (value == null) {
                          print('error email');
                          print(controller.email);
                        }
                      },
                    ),
                    const SizedBox(height: 40.0),
                    CustomTextFormField(
                      text: 'Password',
                      hint: '**********',
                      onSave: (value) {
                        controller.password = value;
                        print('password value' + value!);
                      },
                      validator: (value) {
                        if (value == null) {
                          print('error password');
                          print(controller.password);
                        }
                      },
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
                      onPress: () {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          controller.signInWithEmailAndPassword();
                        }
                      },
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
                      onPress: () {
                        controller.facebookSignInMethod();
                      },
                    ),
                    const SizedBox(height: 40.0),
                    CustomButtonSocial(
                      text: 'Sign in with Google',
                      imageName: 'assets/images/google.png',
                      onPress: () {
                        controller.googleSignInMethod();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
