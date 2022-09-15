import 'package:ecommerce_pesacoder/constants.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    Key? key,
    required this.names,
  }) : super(key: key);

  final List<String> names;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.0,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: names.length,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 20.0),
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(50.0)),
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: 220.0,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Image.asset(
                            'assets/images/Image.png',
                            fit: BoxFit.cover,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                CustomText(text: 'Beoplay Speaker', alignment: Alignment.bottomLeft),
                const SizedBox(height: 10),
                CustomText(text: 'Bang and Olufsen', color: Colors.grey, alignment: Alignment.bottomLeft),
                const SizedBox(height: 20),
                CustomText(text: '\$755', color: Constants.primaryColor, alignment: Alignment.bottomLeft),
              ],
            ),
          );
        },
      ),
    );
  }
}
