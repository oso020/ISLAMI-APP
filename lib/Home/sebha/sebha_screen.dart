import 'package:flutter/material.dart';
import 'package:islami_app/theme_app/color_app.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                Image.asset("assets/images/body_of_seb7a.png"),
                Positioned(
                  bottom: height / 4.2,
                  left: width / 5,
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
                  color: const Color(0xffB7935F),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                "30",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 25),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorApp.primaryColor,
                ),
                onPressed: () {},
                child: const Text(
                  "سبحان الله",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                )),
          )
        ],
      ),
    );
  }
}
