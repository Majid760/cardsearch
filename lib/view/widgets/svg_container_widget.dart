import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGWidget extends StatelessWidget {
  final Map<String, dynamic>? data;
  SVGWidget({Key? key, this.data}) : super(key: key);
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    Color _color = Color.fromRGBO(
        _random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 0.5);
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: Container(
          height: 150,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: _color),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: SvgPicture.asset(data!['imagePath'],
                        height: 40,
                        width: 40,
                        color: _color,
                        semanticsLabel: 'Acme Logo'),
                  ),
                  Text(
                    data!['id'].toString(),
                    style: TextStyle(
                      color: _color.withOpacity(1.0),
                      fontSize: 18,
                    ),
                  ),
                ]),
          )),
    );
  }
}
