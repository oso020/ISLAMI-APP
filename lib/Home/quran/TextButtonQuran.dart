import 'package:flutter/material.dart';
import 'package:islami_app/Home/quran/quran_details.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';
import '../../theme_app/color_app.dart';

class TextButtonQuran extends StatelessWidget {
  final String name;
  final int index;

  const TextButtonQuran({super.key, required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsScreenQuran.routeName,
            arguments: QuranData(name: name, index: index));
      },
      child: Text(
        textAlign: TextAlign.center,
        name,
        style: provider.theme == ThemeMode.light
            ? Theme.of(context).textTheme.bodyLarge
            : Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: ColorApp.whiteColor),
      ),
    );
  }
}

class QuranData {
  final String name;
  final int index;

  QuranData({required this.name, required this.index});
}
