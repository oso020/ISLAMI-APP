import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/theme_app/color_app.dart';

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
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.12,
              horizontal: MediaQuery.of(context).size.width * 0.05),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Color(0x9ef8f8f8)),
          child: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: ColorApp.primaryColor,
                  ),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
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
