import 'package:flutter/material.dart';

class Salon2 extends StatelessWidget {
  const Salon2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kayaçlar Salonu")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const Text(
            "Mağmatik, tortul ve başkalaşım kayalarına ait örnekler, oluşum kökenlerine göre, sistematik olarak ayrı ayrı vitrinlerde örneklenmiştir. Ekonomik değeri ve günlük yaşamda kullanım yeri olan kayaç ve mineraller (mermer, perlit, kömür çeşitleri, petrol ürünleri, radyoaktif mineraller ve çeşitli cevherler) yanısıra,adoğada çok ender rastlanan dev boyutlu kuvars kristalleri, Müzenin en ilginç örneklerini oluşturur. Yarı değerli süs taşı olarak bilinen bazı mineral ve kayaların işlenmiş ve doğal örneklerin bir arada sergilendiği bölüm, galerinin renkli köşelerinden biridir. Galeride, volkanizma ses-duman effektleri ve ilgili posterlerle sergilenmektedir.",
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
