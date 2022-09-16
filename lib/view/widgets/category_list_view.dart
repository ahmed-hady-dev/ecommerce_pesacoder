import 'package:ecommerce_pesacoder/core/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      assignId: true,
      builder: (controller) {
        return SizedBox(
          height: 100.0,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.categoryModelList.length,
            separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 20.0),
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(50.0)),
                    child: Image.network(
                      controller.categoryModelList[index].image!,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(controller.categoryModelList[index].name!, style: const TextStyle())
                ],
              );
            },
          ),
        );
      },
    );
  }
}
