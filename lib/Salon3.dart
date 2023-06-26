import 'package:flutter/material.dart';
import 'package:tabiat_tarihi_app/utils.dart';

class Salon3 extends StatelessWidget {
  const Salon3({super.key});

  @override
  Widget build(BuildContext context) {
    bool run = true;
    return Scaffold(
      appBar: AppBar(title: const Text("Paleontoloji Salonu")),
      body: StreamBuilder(
        stream: visitorRef
            .where('name', isEqualTo: "Paleontoloji Salonu")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List list = snapshot.data!.docs.toList();
            debugPrint("snapshot.hasData : ${list.toString()}");
            int visitors = list[0]["visitor"];
            debugPrint("visitor : $visitors");
            if (run) {
              run = false;
              updateVisitors("salon3", visitors + 1);
            }

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: const Text(
                  "Türkiye’nin çeşitli bölgelerinden toplanmış Tersiyer yaşlı (60 - "
                  "2 milyon yıl öncesi) memeli fosilleri (Proboscidea-Filler, "
                  "Perissodactyla-Tektoynaklılar, Carnivora-Etçiller, "
                  "Rhinocerotidae-Gergedanlar, Artiodactyla-Çifttoynaklılar, "
                  "Giraffidae-Zürafalar gibi), Karbonifer yaşlı (350 milyon "
                  "yıl öncesi) bitki fosilleri (Pteropsida-Eğreltiotları, "
                  "Lycopside-Kibritotları gibi) ve Kambriyenden Pleistosene "
                  "kadar yaşamış çeşitli omurgasız fosilleri sergilenmektedir. "
                  "Perissodactyla, Proboscidea ve Primatatakımlarının 60 milyon "
                  "yıl önce yaşamış atalarına ait fosiller ve günümüz "
                  "temsilcilerine ait örnekler çeşitli panolarda "
                  "sergilenmektedir. Fosillerin düzenlenmesinde jeolojik "
                  "zaman ve evrim gözetilmiştir. Galeride, ayrıca, Salihli "
                  "(Manisa) yöresinde 10.000 yıl öncesine ait bir volkan "
                  "patlaması sonrası oluşan insan ayak izi ve Kahramanmaraş’ta "
                  "Gavur Gölü bataklığında bulunmuş bir Suriye filinin "
                  "(Elephas maxima asurus) iskeleti yer almaktadır.",
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
          } else {
            debugPrint("snapshot has not data");
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
