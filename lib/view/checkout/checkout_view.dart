import 'package:ecommerce_pesacoder/helper/enum.dart';
import 'package:ecommerce_pesacoder/view/checkout/delevery_time.dart';
import 'package:ecommerce_pesacoder/view/checkout/summary.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:status_change/status_change.dart';

import '../../constants.dart';
import '../../core/view_model/checkout_view_model.dart';
import 'add_address.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            "Checkout",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 150.0,
              child: StatusChange.tileBuilder(
                theme: StatusChangeThemeData(
                  direction: Axis.horizontal,
                  connectorTheme: const ConnectorThemeData(space: 1.0, thickness: 1.0),
                ),
                builder: StatusChangeTileBuilder.connected(
                  itemCount: controller.processes.length,
                  itemWidth: (_) => MediaQuery.of(context).size.width / controller.processes.length,
                  contentWidgetBuilder: (context, index) {
                    return const SizedBox();
                  },
                  nameWidgetBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        controller.processes[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: controller.getColor(index),
                        ),
                      ),
                    );
                  },
                  indicatorWidgetBuilder: (_, index) {
                    if (index <= controller.index) {
                      return DotIndicator(
                        size: 35.0,
                        border: Border.all(color: Colors.green, width: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const OutlinedDotIndicator(
                        size: 30,
                        borderWidth: 1.0,
                        color: todoColor,
                      );
                    }
                  },
                  lineWidgetBuilder: (index) {
                    if (index > 0) {
                      if (index == controller.index) {
                        final prevColor = controller.getColor(index - 1);
                        final color = controller.getColor(index);
                        List<Color> gradientColors;
                        gradientColors = [prevColor, Color.lerp(prevColor, color, 0.5)!];
                        return DecoratedLineConnector(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColors,
                            ),
                          ),
                        );
                      } else {
                        return SolidLineConnector(
                          color: controller.getColor(index),
                        );
                      }
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            controller.pages == Pages.deliveryTime
                ? DeliveryTime()
                : controller.pages == Pages.addAddress
                    ? const AddAddress()
                    : const SummaryView(),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.all(24),
                width: 200.0,
                height: 100.0,
                child: CustomButton(
                  text: 'Next',
                  onPress: () {
                    print(controller.index);
                    controller.changeIndex(i: controller.index + 1);
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
