import 'package:flutter/material.dart';

class Salon4 extends StatelessWidget {
  const Salon4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Osteoloji Salonu")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const Text(
            "Günümüzde yaşayan balina, devekuşu, at, domuz, tilki, kanguru, yunus, keçi ve yılan iskeletleri sergilenmektedir. Ayrıca Roma dönemine ait (2000 yıl önce) Uşak’ta yaşamış olan bir insanın iskeleti yer almaktadır .",
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
      ),
    );
  }
}
