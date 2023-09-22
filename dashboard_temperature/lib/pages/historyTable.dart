import 'package:dashboard_temperature/providers/dataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryTable extends ConsumerWidget {
  const HistoryTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(lampItemsProvider);
    final size = MediaQuery.of(context).size;
    return history.when(
      data: (data) {
        return Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: size.width * 0.5,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              color: const Color(0xFF21222D),
              child: Center(child: Text('Historial Lampara 1', style: GoogleFonts.roboto(fontSize: 20))),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ItemTable(title: 'No.', icon: Icons.numbers, mult: 0.1),
                ItemTable(title: 'Hora inicio', icon: Icons.numbers, mult: 0.2),
                ItemTable(title: 'Hora final', icon: Icons.numbers, mult: 0.2),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ItemTable(title: index.toString(), icon: Icons.numbers, mult: 0.1),
                      ItemTable(title: data[index].inicio.toString(), icon: Icons.timer, mult: 0.2),
                      ItemTable(title: data[index].lampItemFinal.toString(), icon: Icons.timer, mult: 0.2),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
      error: (error, _) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class ItemTable extends StatelessWidget {
  const ItemTable({
    super.key,
    required this.title,
    required this.icon,
    required this.mult,
  });

  final String title;
  final IconData icon;
  final double mult;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * mult,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: Color(0xFF21222D),
      child: Row(
        children: [
          Icon(icon),
          Text(
            title,
            style: GoogleFonts.robotoCondensed(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
