import 'package:flutter/material.dart';
import 'package:tabiat_tarihi_app/utils.dart';

class Salon4 extends StatelessWidget {
  const Salon4({super.key});

  @override
  Widget build(BuildContext context) {
    bool run = true;
    return Scaffold(
      appBar: AppBar(title: const Text("Osteoloji Salonu")),
      body: StreamBuilder(
        stream:
            visitorRef.where('name', isEqualTo: "Osteoloji Salonu").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List list = snapshot.data!.docs.toList();
            debugPrint("snapshot.hasData : ${list.toString()}");
            int visitors = list[0]["visitor"];
            debugPrint("visitor : $visitors");
            if (run) {
              run = false;
              updateVisitors("salon4", visitors + 1);
            }

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: const Text(
                  "Günümüzde yaşayan balina, devekuşu, at, domuz, tilki, kanguru, "
                  "yunus, keçi ve yılan iskeletleri sergilenmektedir. Ayrıca "
                  "Roma dönemine ait (2000 yıl önce) Uşak’ta yaşamış olan bir "
                  "insanın iskeleti yer almaktadır .",
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
