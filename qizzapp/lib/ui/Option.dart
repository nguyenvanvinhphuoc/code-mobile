import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  String options;
  Option({Key? key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48,
          width: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 3,
              color: Color(0xffA42FC1),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Text(
                    options,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Radio(value: options, groupValue: 2, onChanged: (val) {})
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
