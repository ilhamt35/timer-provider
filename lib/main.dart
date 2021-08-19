import 'package:flutter/material.dart';

import 'custom_progress_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Timer Provider'),
        ),
        body: Center(
            child: CustomProgressBar(
          width: 100,
          maxValue: 10,
        )),
      ),
    );
  }
}
