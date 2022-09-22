import 'package:ecommerce_pesacoder/constants.dart';
import 'package:ecommerce_pesacoder/view/checkout/checkout_view.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_button.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../core/view_model/cart_view_model.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GetBuilder<CartViewModel>(
            builder: (controller) {
              return controller.cartProductModelList.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/empty_cart.svg',
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 0.6,
                        ),
                        const CustomText(
                          text: 'Cart is empty!',
                          fontSize: 32.0,
                          alignment: Alignment.topCenter,
                        )
                      ],
                    )
                  : Expanded(
                      child: Scaffold(
                        body: Column(
                          children: [
                            ListView.separated(
                              itemCount: controller.cartProductModelList.length,
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 15);
                              },
                              itemBuilder: (context, index) {
                                return SizedBox(
                                    height: 140.0,
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 140,
                                          child: Image.network(
                                            controller.cartProductModelList[index].image.toString(),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 12.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              CustomText(
                                                text: controller.cartProductModelList[index].name.toString(),
                                                fontSize: 18.0,
                                                maxLine: 1,
                                              ),
                                              const SizedBox(height: 10),
                                              CustomText(
                                                text: '\$ ${controller.cartProductModelList[index].price.toString()}',
                                                color: Constants.primaryColor,
                                              ),
                                              const SizedBox(height: 20),
                                              Container(
                                                width: 150.0,
                                                height: 40.0,
                                                color: Colors.grey.shade200,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    IconButton(
                                                        onPressed: () {
                                                          controller.increaseQuantity(index);
                                                        },
                                                        icon: const Icon(
                                                          Icons.add,
                                                          color: Colors.black,
                                                        )),
                                                    const SizedBox(width: 20.0),
                                                    CustomText(
                                                      text: controller.cartProductModelList[index].quantity.toString(),
                                                      alignment: Alignment.center,
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                    ),
                                                    const SizedBox(width: 20.0),
                                                    IconButton(
                                                        onPressed: () {
                                                          controller.decreaseQuantity(index);
                                                        },
                                                        icon: const Icon(
                                                          Icons.remove,
                                                          color: Colors.black,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ));
                              },
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      const CustomText(
                                        text: 'TOTAL',
                                        fontSize: 22,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(height: 15.0),
                                      GetBuilder<CartViewModel>(
                                        // init: Get.find(),
                                        builder: (controller) {
                                          return CustomText(
                                            text: '\$ ${controller.totalPrice}',
                                            fontSize: 18,
                                            color: Constants.primaryColor,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(20.0),
                                    width: 180.0,
                                    height: 100,
                                    child: CustomButton(
                                      onPress: () {
                                        Get.to(const CheckOutView());
                                      },
                                      text: 'CHECKOUT',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
