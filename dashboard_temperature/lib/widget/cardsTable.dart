import 'package:dashboard_temperature/widget/cardCustom.dart';
import 'package:dashboard_temperature/widget/cardCustom2.dart';
import 'package:flutter/material.dart';

class CardsTable extends StatelessWidget {
  const CardsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CardCustom(),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardCustom2(text: 'Lampara 1', lamp: 1, icon: Icons.lightbulb),
            SizedBox(width: size.width * 0.05),
            CardCustom2(text: 'Lampara 2', lamp: 1, icon: Icons.lightbulb),
          ],
        )
      ],
    );
  }
}
