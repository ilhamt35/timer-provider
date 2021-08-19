import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_provider/time_state.dart';

class CustomProgressBar extends StatelessWidget {
  final double width;
  final double maxValue;
  const CustomProgressBar(
      {Key? key, required this.width, required this.maxValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimeState>(
      create: (context) => TimeState(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.timer),
              SizedBox(
                width: 5,
              ),
              Stack(
                children: [
                  Container(
                      width: width,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[300])),
                  Consumer<TimeState>(
                    builder: (context, value, _) => AnimatedContainer(
                      duration: Duration(milliseconds: 1000),
                      width: width * value.time / maxValue,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blueAccent),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Consumer<TimeState>(
            builder: (context, value, _) => ElevatedButton(
                onPressed: () {
                  Timer.periodic(Duration(milliseconds: 1000), (timer) {
                    if (value.time != maxValue) {
                      value.time++;
                    } else {
                      timer.cancel();
                    }
                  });
                },
                child: Text('Mulai')),
          ),
          Consumer<TimeState>(
            builder: (context, value, _) => ElevatedButton(
                onPressed: () {
                  value.time = 0;
                },
                child: Text('Riset')),
          )
        ],
      ),
    );
  }
}
