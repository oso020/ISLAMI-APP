import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: height / 7, bottom: height / 15),
          child: Image.asset("assets/images/radio_image.png"),
        ),
        Text(
          AppLocalizations.of(context)!.quran_radio,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Padding(
          padding: EdgeInsets.only(top: height / 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.skip_next,
                size: width / 11,
              ),
              Icon(
                Icons.play_arrow,
                size: width / 7,
              ),
              Icon(
                Icons.skip_previous,
                size: width / 11,
              ),
            ],
          ),
        )
      ],
    );
  }
}
