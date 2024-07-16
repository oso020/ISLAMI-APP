import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Home/settings/show_bottom_modal_sheet_language.dart';
import 'package:islami_app/Home/settings/show_bottom_modal_sheet_theme.dart';
import 'package:islami_app/theme_app/color_app.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var provider = Provider.of<AppConfigProvider>(context);

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          InkWell(
            onTap: () {
              showBottomModelLanguage();
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width / 20, vertical: height / 35),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: provider.theme == ThemeMode.light
                      ? ColorApp.primaryLightColor
                      : ColorApp.primaryDarkColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == "en"
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Icon(
                    Icons.arrow_downward,
                    color: ColorApp.blackColor,
                  )
                ],
              ),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          InkWell(
            onTap: () {
              showBottomModelTheme();
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width / 20, vertical: height / 35),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: provider.theme == ThemeMode.light
                      ? ColorApp.primaryLightColor
                      : ColorApp.primaryDarkColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.dark,
                  ),
                  Icon(
                    Icons.arrow_downward,
                    color: ColorApp.blackColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showBottomModelLanguage() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ModalSheet(),
    );
  }

  void showBottomModelTheme() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ModalSheetTheme(),
    );
  }
}
