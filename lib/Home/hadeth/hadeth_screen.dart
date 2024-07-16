import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/theme_app/color_app.dart';

import 'TextButtonHadeth.dart';

class HadethScreen extends StatefulWidget {
  static const String routeName = "hadeth_screen";

  HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadethData> hadethList = [];

  @override
  Widget build(BuildContext context) {
    loadFile();
    return Column(
      children: [
        Image.asset("assets/images/ahadeth_image.png"),
        const Divider(),
        Center(
          child: Text(
            AppLocalizations.of(context)!.hadeth_name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const Divider(),
        Expanded(
          child: hadethList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: ColorApp.primaryColor,
                  ),
                )
              : ListView.separated(
                  itemCount: hadethList.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    return TextButtonHadeth(
                      hadethData: hadethList[index],
                    );
                  },
                ),
        ),
      ],
    );
  }

  void loadFile() async {
    String hadethContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadethUse = hadethContent.split("#\r\n");

    for (int i = 0; i < hadethUse.length; i++) {
      List<String> hadethLines = hadethUse[i].split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);

      HadethData hadeth = HadethData(tilte: title, content: hadethLines);
      hadethList.add(hadeth);
      setState(() {});
    }
  }
}

class HadethData {
  String tilte;
  List<String> content;

  HadethData({required this.tilte, required this.content});
}
