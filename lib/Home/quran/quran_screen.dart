import 'package:flutter/material.dart';

import '../../theme_app/color_app.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Image.asset("assets/images/quran_image.png"),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "Surah ",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 5,
                color: ColorApp.primaryColor,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    " Verses",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "ElBaqra",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 5,
                      color: ColorApp.primaryColor,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "286",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
