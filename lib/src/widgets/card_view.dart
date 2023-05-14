import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final String header;
  final double? height;
  final double? width;
  final List<Widget> childrenWidgets;


  const CardView({super.key, required this.header, required this.height, required this.width, required this.childrenWidgets});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.left,
        ),
        Card(
          elevation: Theme.of(context).cardTheme.elevation,
          shadowColor: Colors.black87,
          child: SizedBox(
            height: height,
            width: width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: childrenWidgets,
              ),
            ),
          )
        ),
      ],
    );
  }
}