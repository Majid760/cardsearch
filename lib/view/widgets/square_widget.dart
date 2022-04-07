import 'dart:math';

import 'package:flutter/material.dart';

class SquareWidget extends StatelessWidget {
  final String? title;
  SquareWidget({Key? key, this.title}) : super(key: key);
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(_random.nextInt(256), _random.nextInt(256),
              _random.nextInt(256), _random.nextInt(256)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child: Center(child: Text(title!)),
            ),
            Center(
              child: Text(
                title!,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ));
  }
}
