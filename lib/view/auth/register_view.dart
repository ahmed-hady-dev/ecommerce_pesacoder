import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'viewModel.counter.toString()',
            ),
          ],
        ),
      ),
    );
  }
}
