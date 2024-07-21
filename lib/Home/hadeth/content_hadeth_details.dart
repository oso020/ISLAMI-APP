import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class ContentHadethDetails extends StatelessWidget {
  final String content;

  const ContentHadethDetails({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Text(
      "$content",
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.bodyMedium);
  }
}
