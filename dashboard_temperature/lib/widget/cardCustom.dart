import 'package:dashboard_temperature/providers/dataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCustom extends ConsumerWidget {
  const CardCustom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final averageTemperature = ref.watch(getTemperatureProvider);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.5,
      child: Card(
        color: const Color(0xFF614ED9),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.dew_point, size: 50),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: averageTemperature.when(
                  data: (data) => Text(data, style: GoogleFonts.roboto(fontSize: 50, fontWeight: FontWeight.w900)),
                  error: (error, _) => Text(error.toString()),
                  loading: () => const CircularProgressIndicator(),
                ))
          ],
        ),
      ),
    );
  }
}
