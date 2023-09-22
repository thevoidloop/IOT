import 'package:dashboard_temperature/pages/cardsTable.dart';
import 'package:dashboard_temperature/pages/historyTable.dart';
import 'package:dashboard_temperature/providers/dataProvider.dart';
import 'package:dashboard_temperature/widget/drawer.dart';
import 'package:dashboard_temperature/widget/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final content = ref.watch(homeProvider);

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: size.width * 0.2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
              color: Color(0xFF40464B),
            ),
            child: const DrawerCustom(),
          ),
          SizedBox(width: size.width * 0.6, child: content ? const CardsTable() : const HistoryTable()),
          // const CardsTable()
          Container(
            width: size.width * 0.2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
              color: Color(0xFF40464B),
            ),
            child: const Profile(),
          ),
        ],
      ),
      // appBar: AppBar(),
      // drawer: const DrawerCustom(),
    );
  }
}
