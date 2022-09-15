import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20.0)),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }
}
