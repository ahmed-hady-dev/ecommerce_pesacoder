import 'package:ecommerce_pesacoder/core/view_model/checkout_view_model.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_text.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CheckOutViewModel>(builder: (controller) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                const SizedBox(height: 40.0),
                const CustomText(
                  text: 'Billing address is the same as delivery address',
                  fontSize: 20.0,
                  alignment: Alignment.center,
                ),
                const SizedBox(height: 40.0),
                CustomTextFormField(
                  onSave: (value) {
                    controller.street1 = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this filed cannot be empty';
                    }
                  },
                  text: 'Street 1',
                  hint: '21, Alex Davidson Avenue',
                ),
                const SizedBox(height: 40.0),
                CustomTextFormField(
                  onSave: (value) {
                    controller.street2 = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this filed cannot be empty';
                    }
                  },
                  text: 'Street 2',
                  hint: 'Opposite Omegatron, Vicent Quarters',
                ),
                const SizedBox(height: 40.0),
                CustomTextFormField(
                  onSave: (value) {
                    controller.city = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this filed cannot be empty';
                    }
                  },
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
                          onSave: (value) {
                            controller.state = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'this filed cannot be empty';
                            }
                          },
                          text: 'State',
                          hint: 'Lagos State',
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: CustomTextFormField(
                          onSave: (value) {
                            controller.country = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'this filed cannot be empty';
                            }
                          },
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
      }),
    );
  }
}
