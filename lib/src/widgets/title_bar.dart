import 'package:cricket_scorer/src/core/constants.dart';
import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Text(
              defaultTitleFirst,
              style: Theme.of(context).textTheme.bodyLarge
          ),
          Text(
              defaultTitleLast,
              style: Theme.of(context).textTheme.bodyMedium
          ),
        ]
    );
  }
}
