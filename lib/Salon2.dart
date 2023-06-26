import 'package:flutter/material.dart';
import 'package:tabiat_tarihi_app/utils.dart';

class Salon2 extends StatelessWidget {
  const Salon2({super.key});

  @override
  Widget build(BuildContext context) {
    bool run = true;
    return Scaffold(
      appBar: AppBar(title: const Text("Kayaçlar Salonu")),
      body: StreamBuilder(
        stream:
            visitorRef.where('name', isEqualTo: "Kayaçlar Salonu").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List list = snapshot.data!.docs.toList();
            debugPrint("snapshot.hasData : ${list.toString()}");
            int visitors = list[0]["visitor"];
            debugPrint("visitor : $visitors");
            if (run) {
              run = false;
              updateVisitors("salon2", visitors + 1);
            }

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: const Text(
                  "Mağmatik, tortul ve başkalaşım kayalarına ait örnekler, "
                  "oluşum kökenlerine göre, sistematik olarak ayrı ayrı "
                  "vitrinlerde örneklenmiştir. Ekonomik değeri ve günlük "
                  "yaşamda kullanım yeri olan kayaç ve mineraller (mermer, "
                  "perlit, kömür çeşitleri, petrol ürünleri, radyoaktif "
                  "mineraller ve çeşitli cevherler) yanısıra,adoğada çok "
                  "ender rastlanan dev boyutlu kuvars kristalleri, Müzenin "
                  "en ilginç örneklerini oluşturur. Yarı değerli süs taşı "
                  "olarak bilinen bazı mineral ve kayaların işlenmiş ve "
                  "doğal örneklerin bir arada sergilendiği bölüm, galerinin"
                  " renkli köşelerinden biridir. Galeride, volkanizma "
                  "ses-duman effektleri ve ilgili posterlerle "
                  "sergilenmektedir",
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
