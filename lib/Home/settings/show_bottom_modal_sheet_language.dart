import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/theme_app/color_app.dart';
import 'package:provider/provider.dart';

class ModalSheet extends StatefulWidget {
  const ModalSheet({super.key});

  @override
  State<ModalSheet> createState() => _ModalSheetState();
}

class _ModalSheetState extends State<ModalSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.changeLanguage("en");
              },
              child: provider.locale == "en"
                  ? selectedWidget(AppLocalizations.of(context)!.english)
                  : unSelectedWidget(AppLocalizations.of(context)!.english)),
          InkWell(
              onTap: () {
                provider.changeLanguage("ar");
              },
              child: provider.locale == "ar"
                  ? selectedWidget(AppLocalizations.of(context)!.arabic)
                  : unSelectedWidget(AppLocalizations.of(context)!.arabic))
        ],
      ),
    );
  }

  Widget selectedWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!.copyWith(
                color: ColorApp.primaryLightColor,
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
