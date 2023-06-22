import 'package:flutter/material.dart';

class Salon6 extends StatelessWidget {
  const Salon6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Zooloji Salonu")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const Text(
            "Çeşitli denizel omurgasızlar, deniz balıkları, tatlısu balıkları, sürüngenler, memelilere ait tahnit edilmiş kolleksiyonlar sergilenmektedir. Nesli tükenmiş olan Selçuk yöresinden iki Anadolu panter örneği, çift başlı hazer yılanı ve uzakdoğu kökenli kelebek örnekleri yer almaktadır.",
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
