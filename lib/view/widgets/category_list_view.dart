import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    Key? key,
    required this.names,
  }) : super(key: key);

  final List<String> names;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: names.length,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 20.0),
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(50.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/Icon_Mens Shoe.png'),
                ),
              ),
              const SizedBox(height: 10.0),
              Text(names[index], style: const TextStyle())
            ],
          );
        },
      ),
    );
  }
}
