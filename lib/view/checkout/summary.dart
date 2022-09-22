import 'package:ecommerce_pesacoder/core/view_model/cart_view_model.dart';
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
        return Column(
          children: [
            const SizedBox(height: 40),
            Container(
              height: 350.0,
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                shrinkWrap: true,
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
                            fit: BoxFit.fitWidth,
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
          ],
        );
      }),
    );
  }
}
