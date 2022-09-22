import 'package:ecommerce_pesacoder/core/view_model/cart_view_model.dart';
import 'package:ecommerce_pesacoder/core/view_model/checkout_view_model.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                height: MediaQuery.of(context).size.height * 0.28,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.cartProductModelList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 15.0);
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      width: 150.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 150.0,
                            height: 180.0,
                            child: Image.network(
                              controller.cartProductModelList[index].image.toString(),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            text: TextSpan(
                                text: controller.cartProductModelList[index].name.toString(),
                                style: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 10),
                          CustomText(
                            text: '\$ ${controller.cartProductModelList[index].price.toString()}',
                            alignment: Alignment.bottomLeft,
                            color: Constants.primaryColor,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: CustomText(text: 'Shipping Address', fontSize: 24.0),
              ),
              GetBuilder<CheckOutViewModel>(
                builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text:
                          '${controller.street1}, ${controller.street2}, ${controller.city} , ${controller.state} , ${controller.country}.',
                      fontSize: 24.0,
                      color: Colors.grey,
                    ),
                  );
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
