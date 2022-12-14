import 'package:ecommerce_pesacoder/constants.dart';
import 'package:ecommerce_pesacoder/core/view_model/cart_view_model.dart';
import 'package:ecommerce_pesacoder/model/cart_product_model.dart';
import 'package:ecommerce_pesacoder/model/product_model.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/custom_button.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 270,
            child: Image.network(
              productModel.image.toString(),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 15.0),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomText(text: productModel.name.toString(), fontSize: 26.0),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          width: MediaQuery.of(context).size.width * 0.44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CustomText(
                                text: 'Size',
                              ),
                              CustomText(
                                text: productModel.size.toString(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          width: MediaQuery.of(context).size.width * 0.44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CustomText(
                                text: 'Color',
                              ),
                              Container(
                                width: 30.0,
                                height: 20.0,
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(color: Colors.grey),
                                  color: productModel.color,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    const CustomText(text: 'Details', fontSize: 26.0),
                    const SizedBox(height: 20.0),
                    CustomText(text: productModel.description.toString(), fontSize: 18.0, height: 2),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const CustomText(
                      text: "PRICE ",
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                    CustomText(
                      text: ' \$${productModel.price}',
                      color: Constants.primaryColor,
                      fontSize: 18,
                    )
                  ],
                ),
                GetBuilder<CartViewModel>(
                  // init: Get.find(),
                  builder: (controller) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      width: 180,
                      child: CustomButton(
                        // onPress: () async {
                        //   await controller.deleteDatabase();
                        //   print(controller.cartProductModelList.length);
                        // },
                        onPress: () async {
                          await controller.addProduct(CartProductModel(
                            name: productModel.name,
                            image: productModel.image,
                            price: productModel.price,
                            productId: productModel.productId,
                            quantity: 1,
                          ));
                        },
                        text: 'Add',
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
