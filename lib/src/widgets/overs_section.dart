import 'package:cricket_scorer/src/widgets/card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OversSection extends StatelessWidget {
  int overs;
  Function(String)? onOversChange;

  OversSection({super.key, required this.overs, required this.onOversChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardView(
          header: "Overs",
          height: 80,
          width: 380,
          childrenWidgets: [
            TextField(
              onChanged: onOversChange,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "No of overs in an innings"
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ],
        ),
      ],
    );
  }
}