import 'package:dashboard_temperature/widget/itemDrawer.dart';
import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.10),
          const ItemDrawerCustom(text: 'Inicio', icon: Icons.home_filled, indexSelect: true),
          const ItemDrawerCustom(text: 'Historial', icon: Icons.history, indexSelect: false),
        ],
      ),
    );
  }
}
