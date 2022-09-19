import 'package:ecommerce_pesacoder/constants.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_button.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);
  List<String> names = [
    'Pesa 1',
    'Pesa 2',
    'Pesa 3',
    'Pesa 4',
    'Pesa 5',
  ];
  List<String> images = [
    'assets/images/chaire.png',
    'assets/images/chaire.png',
    'assets/images/chaire.png',
    'assets/images/chaire.png',
    'assets/images/chaire.png',
  ];
  List<int> prices = [
    100,
    200,
    300,
    400,
    500,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.separated(
                itemCount: names.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 15);
                },
                itemBuilder: (context, index) {
                  return Container(
                      height: 140.0,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 140,
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CustomText(
                                  text: names[index],
                                  fontSize: 24.0,
                                ),
                                const SizedBox(height: 10),
                                CustomText(
                                  text: '\$ ${prices[index].toString()}',
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
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.black,
                                          )),
                                      const SizedBox(width: 20.0),
                                      CustomText(
                                        text: '1',
                                        alignment: Alignment.center,
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),
                                      const SizedBox(width: 20.0),
                                      IconButton(
                                          onPressed: () {},
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CustomText(
                      text: 'TOTAL',
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 15.0),
                    CustomText(
                      text: '\$ 2000',
                      fontSize: 18,
                      color: Constants.primaryColor,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  width: 180.0,
                  height: 100,
                  child: CustomButton(
                    onPress: () {},
                    text: 'CHECKOUT',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
