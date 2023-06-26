import 'package:flutter/material.dart';
import 'package:tabiat_tarihi_app/utils.dart';

class Salon6 extends StatelessWidget {
  const Salon6({super.key});

  @override
  Widget build(BuildContext context) {
    bool run = true;
    return Scaffold(
      appBar: AppBar(title: const Text("Zooloji Salonu")),
      body: StreamBuilder(
        stream:
            visitorRef.where('name', isEqualTo: "Zooloji Salonu").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List list = snapshot.data!.docs.toList();
            debugPrint("snapshot.hasData : ${list.toString()}");
            int visitors = list[0]["visitor"];
            debugPrint("visitor : $visitors");
            if (run) {
              run = false;
              updateVisitors("salon6", visitors + 1);
            }

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: const Text(
                  "Çeşitli denizel omurgasızlar, deniz balıkları, tatlısu balıkları, "
                  "sürüngenler, memelilere ait tahnit edilmiş kolleksiyonlar "
                  "sergilenmektedir. Nesli tükenmiş olan Selçuk yöresinden iki "
                  "Anadolu panter örneği, çift başlı hazer yılanı ve uzakdoğu "
                  "kökenli kelebek örnekleri yer almaktadır.",
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
