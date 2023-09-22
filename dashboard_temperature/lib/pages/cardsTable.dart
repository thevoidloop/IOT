import 'package:dashboard_temperature/widget/cardCustom.dart';
import 'package:dashboard_temperature/widget/cardLamp1.dart';
import 'package:dashboard_temperature/widget/cardLamp2.dart';
import 'package:flutter/material.dart';

class CardsTable extends StatelessWidget {
  const CardsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CardCustom(),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CardLamp1(text: 'Lampara 1', icon: Icons.lightbulb),
            SizedBox(width: size.width * 0.05),
            const CardLamp2(text: 'Lampara 2', icon: Icons.lightbulb),
          ],
        )
      ],
    );
  }
}
