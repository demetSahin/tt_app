import 'package:flutter/material.dart';

class Salon3 extends StatelessWidget {
  const Salon3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Paleontoloji Salonu")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          "Fosiller salonudur.",
          style: const TextStyle(
            color: Color(
              0xff296389,
            ),
            fontSize: 24.0,
            //height: 8.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
