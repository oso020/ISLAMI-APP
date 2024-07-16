import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Home/home_screen.dart';
import 'package:islami_app/Home/quran/quran_details.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/theme_app/theme_app.dart';
import 'package:provider/provider.dart';

import 'Home/hadeth/hadeth_details.dart';
import 'Home/hadeth/hadeth_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.lightMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        DetailsScreenQuran.routeName: (context) => DetailsScreenQuran(),
        HadethScreen.routeName: (context) => HadethScreen(),
        DetailsScreenHadeth.routeName: (context) => DetailsScreenHadeth(),
      },
    );
  }
}
