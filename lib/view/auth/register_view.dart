import 'package:ecommerce_pesacoder/core/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_button_social.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
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
              CustomText(
                text: 'SignUp',
                color: Colors.black,
                fontSize: 30.0,
              ),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    CustomTextFormField(
                      text: 'name',
                      hint: 'Pesa',
                      onSave: (value) {
                        controller.name = value;
                        print('name value' + value!);
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
                      text: 'SIGN UP',
                      onPress: () {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          controller.createAccountWithEmailAndPassword();
                        }
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
