


import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Home/radio/RadioModel.dart';

class RadioItem extends StatelessWidget {
  Radios radio;
  AudioPlayer audioPlayer;
   RadioItem({super.key, required this.radio , required this.audioPlayer});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      child: Column(
        children: [

          Text(
            radio.name.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Column(
                  children: [
                    InkWell(
                      onTap:()async{
                        await audioPlayer.pause();
                        await audioPlayer.play(UrlSource(radio.url.toString()));

                      },
                      child: Icon(
                        Icons.play_arrow,
                        size: width / 7,
                      ),
                    ),
                    Text(
                      "play",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap:()async{
                        await audioPlayer.stop();
                      },

                      child: Icon(
                        Icons.stop,
                        size: width / 7,
                      ),
                    ),
                    Text(
                      "pasue",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }


}
