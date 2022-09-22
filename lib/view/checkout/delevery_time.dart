import 'package:ecommerce_pesacoder/constants.dart';
import 'package:ecommerce_pesacoder/helper/enum.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatelessWidget {
  DeliveryTime({Key? key}) : super(key: key);
  Delivery delivery = Delivery.standardDelivery;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          RadioListTile<Delivery>(
            value: Delivery.standardDelivery,
            groupValue: delivery,
            onChanged: (value) {},
            activeColor: Constants.primaryColor,
            title: const CustomText(text: 'Standard Delivery', fontSize: 24.0),
            subtitle: const CustomText(text: '\nOrder will be delivered between 3 - 5 business days', fontSize: 16.0),
          ),
          const SizedBox(height: 48),
          RadioListTile<Delivery>(
            value: Delivery.nextDayDelivery,
            groupValue: delivery,
            onChanged: (value) {},
            activeColor: Constants.primaryColor,
            title: const CustomText(text: 'Next Day Delivery', fontSize: 24.0),
            subtitle: const CustomText(
                text: '\nPlace your order before 6pm and your items will be delivered the next day', fontSize: 16.0),
          ),
          const SizedBox(height: 48),
          RadioListTile<Delivery>(
            value: Delivery.nominatedDelivery,
            groupValue: delivery,
            onChanged: (value) {},
            activeColor: Constants.primaryColor,
            title: const CustomText(text: 'Nominated Delivery', fontSize: 24.0),
            subtitle: const CustomText(
                text: '\nPick a particular date from the calendar and order will be delivered on selected date',
                fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
