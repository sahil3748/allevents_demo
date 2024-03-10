// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';

class CustomCardList extends StatelessWidget {
  const CustomCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  child: Image.network(
                      "https:\/\/cdn2.allevents.in\/thumbs\/thumb5b903cb6755e8.png"))),
          const Flexible(flex: 2, child: Column()),
        ],
      ),
    );
  }
}
