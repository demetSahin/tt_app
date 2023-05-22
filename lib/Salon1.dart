import 'package:flutter/material.dart';

class Salon1 extends StatelessWidget {
  const Salon1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Giriş Salonu")),
      body: const Text("Giriş salonudur."),
    );
  }
}