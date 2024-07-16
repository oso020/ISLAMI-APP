import 'package:flutter/material.dart';
import 'package:islami_app/theme_app/color_app.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  double turns = 0.0;
  List<String> text = [
    "سبحان الله",
    "الحمد الله",
    "استغفر الله",
  ];
  String result = "";
  int counter = 0;
  int textIndex = 0;

  @override
  Widget build(BuildContext context) {
    result = text[textIndex];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height / 10, bottom: height / 22),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedRotation(
                    turns: turns,
                    duration: const Duration(seconds: 1),
                    child: Image.asset("assets/images/body_of_seb7a.png")),
                Positioned(
                  bottom: height / 4.2,
                  left: width / 4,
                  child: Image.asset("assets/images/head_of_seb7a.png"),
                ),
              ],
            ),
          ),
          Text(
            "Number of hymns",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 25),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                  color: const Color(0xffC8B396),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                counter.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 25),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorApp.primaryColor,
                ),
                onPressed: () {
                  rotationSebha();
                  changeText();
                },
                child: Text(
                  result,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                )),
          )
        ],
      ),
    );
  }

  void rotationSebha() {
    turns += 1 / 28;
    setState(() {});
  }

  void changeText() {
    counter++;
    if (counter == 33) {
      counter = 0;
      if (textIndex < text.length - 1) {
        textIndex += 1;
      } else {
        textIndex = 0;
      }
      result = text[textIndex];
    }
  }
}
