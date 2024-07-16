import 'package:flutter/material.dart';
import 'package:islami_app/Home/hadeth/hadeth_screen.dart';
import 'package:islami_app/Home/quran/quran_screen.dart';
import 'package:islami_app/Home/radio/radio_screen.dart';
import 'package:islami_app/Home/sebha/sebha_screen.dart';

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
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
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
            items: const [
              BottomNavigationBarItem(
                label: "Quran",
                icon: ImageIcon(AssetImage(
                  "assets/images/icon_quran.png",
                )),
              ),
              BottomNavigationBarItem(
                label: "Hadeth",
                icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
              ),
              BottomNavigationBarItem(
                label: "Sebha",
                icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
              ),
              BottomNavigationBarItem(
                label: "radio",
                icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Islami",
            style: Theme.of(context).textTheme.bodyLarge,
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
    const RadioScreen()
  ];
}
