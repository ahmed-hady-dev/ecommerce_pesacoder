import 'package:flutter/cupertino.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Summary",
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}