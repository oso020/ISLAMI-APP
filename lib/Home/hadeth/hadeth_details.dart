import 'package:flutter/material.dart';
import 'package:islami_app/Home/hadeth/hadeth_screen.dart';
import 'package:islami_app/theme_app/color_app.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';
import 'content_hadeth_details.dart';

class DetailsScreenHadeth extends StatefulWidget {
  static const String routeName = "details_screen_hadeth";

  const DetailsScreenHadeth({super.key});

  @override
  State<DetailsScreenHadeth> createState() => _DetailsScreenQuranState();
}

class _DetailsScreenQuranState extends State<DetailsScreenHadeth> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethData;
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: provider.theme == ThemeMode.light
                  ? AssetImage("assets/images/background.png")
                  : AssetImage("assets/images/bg.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.tilte,
              style: provider.theme == ThemeMode.light
                  ? Theme.of(context).textTheme.bodyLarge
                  : Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: ColorApp.whiteColor)),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.12,
              horizontal: MediaQuery.of(context).size.width * 0.05),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Color(0x9ef8f8f8)),
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: ColorApp.whiteColor,
            ),
            itemCount: args.content.length,
            itemBuilder: (context, index) {
              return ContentHadethDetails(
                content: args.content[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
