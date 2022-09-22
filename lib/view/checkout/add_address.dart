import 'package:ecommerce_pesacoder/view/widgets/custom_text.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40.0),
            CustomText(
              text: 'Billing address is the same as delivery address',
              fontSize: 20.0,
              alignment: Alignment.center,
            ),
            const SizedBox(height: 40.0),
            CustomTextFormField(
              onSave: (p0) {},
              validator: (value) {},
              text: 'Street 1',
              hint: '21, Alex Davidson Avenue',
            ),
            const SizedBox(height: 40.0),
            CustomTextFormField(
              onSave: (p0) {},
              validator: (value) {},
              text: 'Street 1',
              hint: '21, Alex Davidson Avenue',
            ),
            const SizedBox(height: 40.0),
            CustomTextFormField(
              onSave: (p0) {},
              validator: (value) {},
              text: 'Street 2',
              hint: 'Opposite Omegatron, Vicent Quarters',
            ),
            const SizedBox(height: 40.0),
            CustomTextFormField(
              onSave: (p0) {},
              validator: (value) {},
              text: 'City',
              hint: 'Victoria Island',
            ),
            const SizedBox(height: 40.0),
            SizedBox(
              width: Get.width,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CustomTextFormField(
                      onSave: (p0) {},
                      validator: (value) {},
                      text: 'State',
                      hint: 'Lagos State',
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: CustomTextFormField(
                      onSave: (p0) {},
                      validator: (value) {},
                      text: 'Country',
                      hint: 'Nigeria',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
