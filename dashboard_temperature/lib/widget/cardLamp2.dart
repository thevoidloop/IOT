import 'package:dashboard_temperature/providers/dataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CardLamp2 extends ConsumerWidget {
  const CardLamp2({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final powerAsync = ref.watch(getLamp2PowerProvider);
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width * 0.20,
        child: powerAsync.when(
          data: (power) {
            return Card(
              color: (power == 1) ? const Color(0xFF5D51DA) : null,
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
