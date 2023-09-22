import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        Avatar(),
        SizedBox(height: 60),
        Dispositivos(),
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: const DecorationImage(image: AssetImage('assets/avatar.jpeg')),
          ),
        ),
        const SizedBox(height: 15),
        Text('Daniel Marroquin', style: GoogleFonts.roboto(fontSize: 18))
      ],
    );
  }
}

class Dispositivos extends StatelessWidget {
  const Dispositivos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 20),
          child: Text('Dispositivos', style: GoogleFonts.roboto(fontSize: 16)),
        ),
        const SizedBox(height: 15),
        const ItemDispositivos(title: 'Sensor de temperatura', subTitle: 'Modulo analogico LM35 | 4v - 30v'),
        const ItemDispositivos(title: 'Lampara 1', subTitle: 'Modulo rele optoacoplador | 3.3v'),
        const ItemDispositivos(title: 'Lampara 2', subTitle: 'Modulo rele optoacoplador | 3.3v'),
      ],
    );
  }
}

class ItemDispositivos extends StatelessWidget {
  const ItemDispositivos({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.18,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xFF21222D)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(subTitle, style: GoogleFonts.robotoCondensed(fontSize: 12)),
        ],
      ),
    );
  }
}
