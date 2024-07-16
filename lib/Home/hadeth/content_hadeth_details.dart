import 'package:flutter/material.dart';

class ContentHadethDetails extends StatelessWidget {
  final String content;

  const ContentHadethDetails({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$content",
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
