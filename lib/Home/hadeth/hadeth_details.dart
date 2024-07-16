import 'package:flutter/material.dart';
import 'package:islami_app/Home/hadeth/hadeth_screen.dart';

import 'content_hadeth_details.dart';

class DetailsScreenHadeth extends StatefulWidget {
  static const String routeName = "details_screen_hadeth";

  const DetailsScreenHadeth({super.key});

  @override
  State<DetailsScreenHadeth> createState() => _DetailsScreenQuranState();
}

class _DetailsScreenQuranState extends State<DetailsScreenHadeth> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethData;

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.tilte,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.12,
              horizontal: MediaQuery.of(context).size.width * 0.05),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Color(0x9ef8f8f8)),
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: args.content.length,
            itemBuilder: (context, index) {
              return ContentHadethDetails(
                content: args.content[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
