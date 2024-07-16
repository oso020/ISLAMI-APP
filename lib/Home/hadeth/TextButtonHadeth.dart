import 'package:flutter/material.dart';
import 'package:islami_app/Home/hadeth/hadeth_details.dart';
import 'package:islami_app/Home/hadeth/hadeth_screen.dart';

class TextButtonHadeth extends StatelessWidget {
  final HadethData hadethData;

  const TextButtonHadeth({super.key, required this.hadethData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsScreenHadeth.routeName,
            arguments: hadethData);
      },
      child: Text(
        textAlign: TextAlign.center,
        hadethData.tilte,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
