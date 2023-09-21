import 'package:dashboard_temperature/providers/dataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCustom2 extends ConsumerWidget {
  const CardCustom2({super.key, required this.text, required this.lamp, required this.icon});

  final String text;
  final int lamp;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final powerAsync = ref.watch(getLamp1PowerProvider);
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.20,
        child: powerAsync.when(
          data: (power) {
            return Card(
              color: (power == 1) ? Color.fromRGBO(66, 32, 140, 1) : null,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(icon, size: 50),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text, style: GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.w900)),
                  )
                ],
              ),
            );
          },
          error: (error, _) => Text(error.toString()),
          loading: () => null,
        ));
  }
}
