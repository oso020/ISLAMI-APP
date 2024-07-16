import 'package:flutter/material.dart';

class ContentQuranDetails extends StatelessWidget {
  final int index;
  final List<String> verses;

  const ContentQuranDetails(
      {super.key, required this.index, required this.verses});

  @override
  Widget build(BuildContext context) {
    return Text(
      "${verses[index]} (${index + 1})",
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
