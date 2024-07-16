import 'package:flutter/material.dart';
import 'package:islami_app/Home/hadeth/hadeth_details.dart';
import 'package:islami_app/Home/hadeth/hadeth_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';
import '../../theme_app/color_app.dart';

class TextButtonHadeth extends StatelessWidget {
  final HadethData hadethData;

  const TextButtonHadeth({super.key, required this.hadethData});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsScreenHadeth.routeName,
            arguments: hadethData);
      },
      child: Text(
        textAlign: TextAlign.center,
        hadethData.tilte,
          style: provider.theme == ThemeMode.light
              ? Theme.of(context).textTheme.bodyLarge
              : Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: ColorApp.whiteColor)),
    );
  }
}
