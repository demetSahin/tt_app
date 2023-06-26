import 'package:flutter/material.dart';
import 'package:tabiat_tarihi_app/utils.dart';

class Salon1 extends StatelessWidget {
  const Salon1({super.key});

  @override
  Widget build(BuildContext context) {
    bool run = true;
    return Scaffold(
      appBar: AppBar(title: const Text("Giriş Salonu")),
      body: StreamBuilder(
        stream: visitorRef.where('name', isEqualTo: "Giriş Salonu").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List list = snapshot.data!.docs.toList();
            debugPrint("snapshot.hasData : ${list.toString()}");
            int visitors = list[0]["visitor"];
            debugPrint("visitor : $visitors");
            if (run) {
              run = false;
              updateVisitors("salon1", visitors + 1);
            }

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: const Text(
                  "Ege Üniversitesi Fen Fakültesine bağlı bir Tabiat Tarihi Müzesi kurulması düşüncesi, ilk kez 1963 yılında ortaya atılmış ve 1967 yılında yaşama geçirilmiştir. Tabiat Tarihi Müzesi 1973 yılında Cumhuriyet’in 50. yılı kutlama programı çerçevesinde, doğa ve doğa tarihi ile ilgili objeleri ilk kez topluma sunmuştur.Tabiat Tarihi Müzesi, tüm doğa tarihi ve doğa zenginliklerinin toplandığı, korunduğu ve belirli bir sistematik ve evrimsel düzen içerisinde sergilendiği görsel ve bilimsel bir ortamdır. Tabiat Tarihi Müzeleri, bir bağlamda doğanın tüm görkemiyle ve gizemiyle toplumun hizmetine bir zaman tünelinde gibi sunulduğu ortamlardır. Ayrıca, doğanın gizemi topluma çeşitli panolarla ve dioramalarla sunulmaya çalışılırken, 4,5 milyar yıl önce oluşmuş dünyamızın geçirdiği evrimi anlamaya, öğrenmeyi ve sorgulamayı da amaçlamaktadır.",
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
