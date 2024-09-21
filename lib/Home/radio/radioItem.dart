


import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Home/radio/RadioModel.dart';

class RadioItem extends StatefulWidget {
  Radios radio;
  AudioPlayer audioPlayer;

   RadioItem({super.key, required this.radio , required this.audioPlayer});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
   var isPlayed=false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      child: Column(
        children: [

          Text(
            widget.radio.name.toString(),
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
                        isPlayed= !isPlayed;
                        if(isPlayed == true){
                          await widget.audioPlayer.pause();
                          await widget.audioPlayer.play(UrlSource(widget.radio.url.toString()));
                        }else{
                          await widget.audioPlayer.pause();

                        }
                        setState(() {

                        });


                      },
                      child: Icon(
                        isPlayed==false?Icons.play_arrow:Icons.stop,
                        size: width / 7,
                      ),
                    ),
                    Text(
                      isPlayed==false?"play" :"pause",
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
