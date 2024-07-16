import 'package:flutter/material.dart';
import 'package:islami_app/Home/quran/quran_details.dart';

class TextButtonQuran extends StatelessWidget {
  final String name;
  final int index;

  const TextButtonQuran({super.key, required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsScreenQuran.routeName,
            arguments: QuranData(name: name, index: index));
      },
      child: Text(
        textAlign: TextAlign.center,
        name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

class QuranData {
  final String name;
  final int index;

  QuranData({required this.name, required this.index});
}
