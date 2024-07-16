import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Home/hadeth/hadeth_screen.dart';
import 'package:islami_app/Home/quran/quran_screen.dart';
import 'package:islami_app/Home/radio/radio_screen.dart';
import 'package:islami_app/Home/sebha/sebha_screen.dart';
import 'package:islami_app/Home/settings/settings_screen.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';
import '../theme_app/color_app.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Theme.of(context).primaryColor),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (selectedItem) {
              currentIndex = selectedItem;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                label: AppLocalizations.of(context)!.quran,
                icon: ImageIcon(AssetImage(
                  "assets/images/icon_quran.png",
                )),
              ),
              BottomNavigationBarItem(
                label: AppLocalizations.of(context)!.hadeth,
                icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
              ),
              BottomNavigationBarItem(
                label: AppLocalizations.of(context)!.sebha,
                icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
              ),
              BottomNavigationBarItem(
                label: AppLocalizations.of(context)!.radio,
                icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
              ),
              BottomNavigationBarItem(
                label: AppLocalizations.of(context)!.settings,
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.islami,
            style: provider.theme == ThemeMode.light
                ? Theme.of(context).textTheme.bodyLarge
                : Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: ColorApp.whiteColor),
          ),
        ),
        body: tabs[currentIndex],
      ),
    );
  }

  List<Widget> tabs = [
    QuranScreen(),
    HadethScreen(),
    const SebhaScreen(),
    const RadioScreen(),
    const SettingsScreen(),
  ];
}
