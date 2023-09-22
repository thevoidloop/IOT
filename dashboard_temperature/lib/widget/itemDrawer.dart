import 'package:dashboard_temperature/providers/dataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDrawerCustom extends ConsumerWidget {
  const ItemDrawerCustom({super.key, required this.text, required this.icon, required this.indexSelect});

  final String text;
  final IconData icon;
  final bool indexSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final select = ref.watch(homeProvider);
    return GestureDetector(
      onTap: () => ref.read(homeProvider.notifier).state = indexSelect,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 50,
        decoration: BoxDecoration(
          color: (select == indexSelect) ? const Color(0xFF21222D) : const Color(0xFF303030),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 30),
            Text(text, style: GoogleFonts.roboto(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
