import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/theme_app/color_app.dart';
import 'package:provider/provider.dart';

class ModalSheetTheme extends StatefulWidget {
  const ModalSheetTheme({super.key});

  @override
  State<ModalSheetTheme> createState() => _ModalSheetThemeState();
}

class _ModalSheetThemeState extends State<ModalSheetTheme> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: provider.theme == ThemeMode.light
                  ? selectedWidget(AppLocalizations.of(context)!.light,provider.theme == ThemeMode.light
                  ? ColorApp.primaryLightColor
                  : ColorApp.primaryDarkColor,)
                  : unSelectedWidget(AppLocalizations.of(context)!.light)),
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: provider.theme == ThemeMode.dark
                  ? selectedWidget(AppLocalizations.of(context)!.dark,provider.theme == ThemeMode.light
                  ? ColorApp.primaryLightColor
                  : ColorApp.primaryDarkColor,)
                  : unSelectedWidget(AppLocalizations.of(context)!.dark))
        ],
      ),
    );
  }

  Widget selectedWidget(String text,Color theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: theme,
              ),
        ),
        Icon(
          Icons.check,
          size: 35,
        )
      ],
    );
  }

  Widget unSelectedWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: ColorApp.blackColor),
        ),
      ],
    );
  }
}
