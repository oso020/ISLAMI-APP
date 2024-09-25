import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Home/radio/radioItem.dart';
import 'package:http/http.dart' as http;
import 'package:islami_app/theme_app/color_app.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../../providers/app_config_provider.dart';
import 'RadioModel.dart';

class RadioScreen extends StatelessWidget {
   RadioScreen({super.key});

  AudioPlayer player=AudioPlayer();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var provider = Provider.of<AppConfigProvider>(context);

    return FutureBuilder<RadioModel>(
      future: getRadio(provider.locale=="ar"?"ar":"eng"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(
              color: provider.theme == ThemeMode.light
                  ? ColorApp.primaryLightColor
                  : ColorApp.primaryDarkColor,
            ),
          );
        }
     else if(snapshot.hasData){
         return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height / 7, bottom: height / 15),
              child: Image.asset("assets/images/radio_image.png"),
            ),
            Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RadioItem(
                      radio: snapshot.data!.radios![index],
                      audioPlayer: player,
                    );
                  },
                ))
          ],
        );
      }

      else{
        return Center(child: Text("please Check Your Network"));
      }
    },);
  }

  Future<RadioModel>getRadio(String language) async {
    // https://mp3quran.net/api/v3/radios
    var url = Uri.https('mp3quran.net', '/api/v3/radios',{
      "language":language
    });

    var response = await http.get(url);

    var response2 = jsonDecode(response.body);

    var object=RadioModel.fromJson(response2);

    return object;
  }
}
