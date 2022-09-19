import 'package:ecommerce_pesacoder/constants.dart';
import 'package:ecommerce_pesacoder/core/view_model/home_view_model.dart';
import 'package:ecommerce_pesacoder/view/details_view.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(builder: (controller) {
      return SizedBox(
        height: 350.0,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.productModelList.length,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 20.0),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Get.to(() => DetailsView(productModel: controller.productModelList[index])),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(50.0)),
                      child: Column(
                        children: <Widget>[
                          Container(
                              height: 220.0,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Image.network(
                                controller.productModelList[index].image.toString(),
                                fit: BoxFit.cover,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                        text: controller.productModelList[index].name.toString(), alignment: Alignment.bottomLeft),
                    const SizedBox(height: 10),
                    CustomText(
                      text: controller.productModelList[index].description.toString(),
                      color: Colors.grey,
                      alignment: Alignment.bottomLeft,
                      maxLine: 1,
                    ),
                    const SizedBox(height: 20),
                    CustomText(
                        text: '\$${controller.productModelList[index].price.toString()}',
                        color: Constants.primaryColor,
                        alignment: Alignment.bottomLeft),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
