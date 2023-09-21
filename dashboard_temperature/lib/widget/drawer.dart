import 'package:dashboard_temperature/widget/itemDrawer.dart';
import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      width: size.width * 0.2,
      child: ListView(
        children: [
          SizedBox(height: size.height * 0.15),
          const ItemDrawerCustom(text: 'Home', icon: Icons.home_filled),
          const ItemDrawerCustom(text: 'History', icon: Icons.history),
        ],
      ),
    );
  }
}
