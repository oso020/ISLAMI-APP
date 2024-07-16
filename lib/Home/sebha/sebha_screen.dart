import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/theme_app/color_app.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  double turns = 0.0;
  List<String> text = [
    "سبحان الله",
    "الحمد الله",
    "استغفر الله",
  ];
  String result = "";
  int counter = 0;
  int textIndex = 0;

  @override
  Widget build(BuildContext context) {
    result = text[textIndex];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var provider = Provider.of<AppConfigProvider>(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height / 10, bottom: height / 22),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedRotation(
                    turns: turns,
                    duration: const Duration(seconds: 1),
                    child: provider.theme == ThemeMode.light
                        ? Image.asset("assets/images/body_of_seb7a.png")
                        : Image.asset("assets/images/dark_body_of_seb7a.png")),
                Positioned(
                  bottom: height / 4.2,
                  left: width / 4,
                  child: provider.theme == ThemeMode.light
                      ? Image.asset("assets/images/head_of_seb7a.png")
                      : Image.asset("assets/images/dark_head_of_seb7a.png"),
                ),
              ],
            ),
          ),
          Text(
            AppLocalizations.of(context)!.number_of_hymns,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 25),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                  color: provider.theme == ThemeMode.light
                      ? Color(0xffC8B396)
                      : ColorApp.primaryDarkColorBlue,
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                counter.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 25),
            child: ElevatedButton(
                style: provider.theme == ThemeMode.light
                    ? ElevatedButton.styleFrom(
                        backgroundColor: ColorApp.primaryLightColor)
                    : ElevatedButton.styleFrom(
                        backgroundColor: ColorApp.primaryDarkColor),
                onPressed: () {
                  rotationSebha();
                  changeText();
                },
                child: Text(
                  result,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                )),
          )
        ],
      ),
    );
  }

  void rotationSebha() {
    turns += 1 / 28;
    setState(() {});
  }

  void changeText() {
    counter++;
    if (counter == 33) {
      counter = 0;
      if (textIndex == text.length - 1) {
        textIndex = 0;
      } else {
        textIndex += 1;
      }
      result = text[textIndex];
    }
  }
}
