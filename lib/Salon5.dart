import 'package:flutter/material.dart';

class Salon5 extends StatelessWidget {
  const Salon5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kuşlar Salonu")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const Text(
            "Türkiye, Avrupa, Asya ve Afrika kıtaları arasında doğal bir köprü işlevi görmektedir. Sahip olduğu bu coğrafi konumu nedeniyle Türkiye’de 426 kuş türü gözlenmektedir. Galeride, özellikle Ege Bölgesinde gözlenen 104 tür kuş (atmaca, kartal, flamingo, pelikan, balıkçıl gibi) sergilenmektedir. Ayrıca, ziyaretçilere kuş yumurtalarının çeşitliliği konusunda bilgi verilmesi amacı ile 31 değişik kuşun yumurtası da yer almaktadır.",
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
