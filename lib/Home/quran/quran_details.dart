import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/theme_app/color_app.dart';
import 'package:provider/provider.dart';

import 'TextButtonQuran.dart';
import 'content_quran_details.dart';

class DetailsScreenQuran extends StatefulWidget {
  static const String routeName = "details_screen_quran";

  const DetailsScreenQuran({super.key});

  @override
  State<DetailsScreenQuran> createState() => _DetailsScreenQuranState();
}

class _DetailsScreenQuranState extends State<DetailsScreenQuran> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as QuranData;
    var provider = Provider.of<AppConfigProvider>(context);
    if (verses.isEmpty) {
      loadFile(args.index);
    }
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
            args.name,
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
              color: Theme.of(context).primaryColor),
          child: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: ColorApp.primaryLightColor,
                  ),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: ColorApp.whiteColor,
                  ),
                  itemCount: verses.length,
                  itemBuilder: (context, index) {
                    return ContentQuranDetails(
                      index: index,
                      verses: verses,
                    );
                  },
                ),
        ),
      ),
    );
  }

  void loadFile(index) async {
    String quran = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> quranUse = quran.split("\n");
    verses = quranUse;
    setState(() {});
  }
}
