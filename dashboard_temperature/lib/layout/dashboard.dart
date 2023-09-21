import 'package:dashboard_temperature/widget/cardsTable.dart';
import 'package:dashboard_temperature/widget/drawer.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Container(width: size.width * 0.2),
          Container(width: size.width * 0.6, child: CardsTable()),
          Container(width: size.width * 0.2),
        ],
      ),
      // appBar: AppBar(),
      drawer: const DrawerCustom(),
    );
  }
}
