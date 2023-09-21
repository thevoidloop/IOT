import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDrawerCustom extends StatelessWidget {
  const ItemDrawerCustom({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(66, 32, 140, 1),
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
    );
  }
}
