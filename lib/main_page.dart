import 'package:flutter/material.dart';
import 'package:tabiat_tarihi_app/salon.dart';
import 'utils.dart';
import 'qr_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SafeArea(
      child: Scrollbar(
        child: CustomScrollView(
          controller: ScrollController(),
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    child: Container(
                      height: 896 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36 * fem),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xfff6f5f5),
                          borderRadius: BorderRadius.circular(36 * fem),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 29 * fem,
                              top: 395 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 161 * fem,
                                  height: 106 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10 * fem),
                                        topRight: Radius.circular(10 * fem),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 29 * fem,
                              top: 34 * fem,
                              child: Container(
                                width: 356 * fem,
                                height: 843 * fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 15 * fem, 36 * fem),
                                      child: Text(
                                        'Tabiat Tarihi',
                                        style: SafeGoogleFont(
                                          'Josefin Sans',
                                          fontSize: 30 * ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1 * ffem / fem,
                                          color: Color(0xff252468),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const QRView(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: const Color.fromRGBO(
                                                    252, 215, 157, 1),
                                              ),
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/screens/images/qr-code-1.png',
                                                    width: 100,
                                                    height: 100,
                                                  ),
                                                  const SizedBox(height: 8.0),
                                                  const Text(
                                                    'QR Kod',
                                                    style: TextStyle(
                                                        fontSize: 16.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 24 * fem),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Salon(
                                                              title:
                                                                  "Giriş Salonu",
                                                              id: "salon1",
                                                              /*description:
                                                                  "Ege Üniversitesi Fen Fakültesine bağlı bir Tabiat Tarihi "
                                                                  "Müzesi kurulması düşüncesi, ilk kez 1963 yılında ortaya "
                                                                  "atılmış ve 1967 yılında yaşama geçirilmiştir. "
                                                                  "Tabiat Tarihi Müzesi 1973 yılında Cumhuriyet’in "
                                                                  "50. yılı kutlama programı çerçevesinde, doğa ve "
                                                                  "doğa tarihi ile ilgili objeleri ilk kez topluma "
                                                                  "sunmuştur.Tabiat Tarihi Müzesi, tüm doğa tarihi "
                                                                  "ve doğa zenginliklerinin toplandığı, korunduğu ve "
                                                                  "belirli bir sistematik ve evrimsel düzen içerisinde "
                                                                  "sergilendiği görsel ve bilimsel bir ortamdır. Tabiat "
                                                                  "Tarihi Müzeleri, bir bağlamda doğanın tüm görkemiyle "
                                                                  "ve gizemiyle toplumun hizmetine bir zaman tünelinde "
                                                                  "gibi sunulduğu ortamlardır. Ayrıca, doğanın gizemi "
                                                                  "topluma çeşitli panolarla ve dioramalarla sunulmaya "
                                                                  "çalışılırken, 4,5 milyar yıl önce oluşmuş dünyamızın "
                                                                  "geçirdiği evrimi anlamaya, öğrenmeyi ve sorgulamayı "
                                                                  "da amaçlamaktadır.",*/
                                                              imagePath:
                                                                  'assets/screens/images/open-door-1.png',
                                                            )
                                                        /*const Salon1(),*/
                                                        ),
                                                  );
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 30),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: const Color.fromRGBO(
                                                        252, 215, 157, 1),
                                                  ),
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Hero(
                                                        tag: "salon1",
                                                        child: Image.asset(
                                                          'assets/screens/images/open-door-1.png',
                                                          width: 80,
                                                          height: 80,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 8.0),
                                                      const Text(
                                                        'Giriş',
                                                        style: TextStyle(
                                                            fontSize: 16.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              // SizedBox(width:  ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Salon(
                                                              title:
                                                                  "Kayaçlar Salonu",
                                                              id: "salon2",
                                                              /*description:
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
                                                                  "sergilenmektedir",*/
                                                              imagePath:
                                                                  'assets/screens/images/stone-1.png',
                                                            )
                                                        /*const Salon2(),*/
                                                        ),
                                                  );
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 30),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: const Color.fromRGBO(
                                                        190, 232, 246, 1),
                                                  ),
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Hero(
                                                        tag: "salon2",
                                                        child: Image.asset(
                                                          'assets/screens/images/stone-1.png',
                                                          width: 80,
                                                          height: 80,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 8.0),
                                                      const Text(
                                                        'Kayaçlar',
                                                        style: TextStyle(
                                                            fontSize: 16.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 24 * fem),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Salon(
                                                              title:
                                                                  "Paleontoloji Salonu",
                                                              id: "salon3",
                                                              /*description:
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
                                                                  "(Elephas maxima asurus) iskeleti yer almaktadır.",*/
                                                              imagePath:
                                                                  'assets/screens/images/fossil-1.png',
                                                            )
                                                        /*const Salon3(),*/
                                                        ),
                                                  );
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 30),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: const Color.fromRGBO(
                                                        190, 232, 246, 1),
                                                  ),
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Hero(
                                                        tag: "salon3",
                                                        child: Image.asset(
                                                          'assets/screens/images/fossil-1.png',
                                                          width: 80,
                                                          height: 80,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 8.0),
                                                      const Text(
                                                        'Paleontoloji',
                                                        style: TextStyle(
                                                            fontSize: 16.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              // SizedBox(width:  ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Salon(
                                                              title:
                                                                  "Osteoloji Salonu",
                                                              id: "salon4",
                                                              /*description:
                                                                  "Günümüzde yaşayan balina, devekuşu, at, domuz, tilki, kanguru, "
                                                                  "yunus, keçi ve yılan iskeletleri sergilenmektedir. Ayrıca "
                                                                  "Roma dönemine ait (2000 yıl önce) Uşak’ta yaşamış olan bir "
                                                                  "insanın iskeleti yer almaktadır.",*/
                                                              imagePath:
                                                                  'assets/screens/images/evolution-1.png',
                                                            )
                                                        /*const Salon4(),*/
                                                        ),
                                                  );
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 30),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: const Color.fromRGBO(
                                                        252, 215, 157, 1),
                                                  ),
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Hero(
                                                        tag: "salon4",
                                                        child: Image.asset(
                                                          'assets/screens/images/evolution-1.png',
                                                          width: 80,
                                                          height: 80,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 8.0),
                                                      const Text(
                                                        'Osteoloji',
                                                        style: TextStyle(
                                                            fontSize: 16.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 24 * fem),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Salon(
                                                              title:
                                                                  "Kuşlar Salonu",
                                                              id: "salon5",
                                                              /*description:
                                                                  "Türkiye, Avrupa, Asya ve Afrika kıtaları arasında doğal bir "
                                                                  "köprü işlevi görmektedir. Sahip olduğu bu coğrafi konumu "
                                                                  "nedeniyle Türkiye’de 426 kuş türü gözlenmektedir. Galeride, "
                                                                  "özellikle Ege Bölgesinde gözlenen 104 tür kuş (atmaca, "
                                                                  "kartal, flamingo, pelikan, balıkçıl gibi) sergilenmektedir. "
                                                                  "Ayrıca, ziyaretçilere kuş yumurtalarının çeşitliliği "
                                                                  "konusunda bilgi verilmesi amacı ile 31 değişik kuşun "
                                                                  "yumurtası da yer almaktadır.",*/
                                                              imagePath:
                                                                  'assets/screens/images/birds-1.png',
                                                            )
                                                        /*const Salon5(),*/
                                                        ),
                                                  );
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 30),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: const Color.fromRGBO(
                                                        252, 215, 157, 1),
                                                  ),
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Hero(
                                                        tag: "salon5",
                                                        child: Image.asset(
                                                          'assets/screens/images/birds-1.png',
                                                          width: 80,
                                                          height: 80,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 8.0),
                                                      const Text(
                                                        'Kuşlar',
                                                        style: TextStyle(
                                                            fontSize: 16.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              // SizedBox(width:  ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Salon(
                                                              title:
                                                                  "Zooloji Salonu",
                                                              id: "salon6",
                                                              /*description:
                                                                  "Çeşitli denizel omurgasızlar, deniz balıkları, tatlısu balıkları, "
                                                                  "sürüngenler, memelilere ait tahnit edilmiş kolleksiyonlar "
                                                                  "sergilenmektedir. Nesli tükenmiş olan Selçuk yöresinden iki "
                                                                  "Anadolu panter örneği, çift başlı hazer yılanı ve uzakdoğu "
                                                                  "kökenli kelebek örnekleri yer almaktadır.",*/
                                                              imagePath:
                                                                  'assets/screens/images/elephant.png',
                                                            )
                                                        /*const Salon6(),*/
                                                        ),
                                                  );
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 30),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: const Color.fromRGBO(
                                                        190, 232, 246, 1),
                                                  ),
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Hero(
                                                        tag: "salon6",
                                                        child: Image.asset(
                                                          'assets/screens/images/elephant.png',
                                                          width: 80,
                                                          height: 80,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 8.0),
                                                      const Text(
                                                        'Zooloji',
                                                        style: TextStyle(
                                                            fontSize: 16.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          /*SizedBox(height: 24 * fem),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Istatistikler(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              margin: const EdgeInsets.only(
                                                right: 36,
                                                left: 36,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: const Color.fromRGBO(
                                                    190, 232, 246, 1),
                                              ),
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: const Text(
                                                'İstatistikler',
                                                textAlign: TextAlign.center,
                                                style:
                                                    TextStyle(fontSize: 30.0),
                                              ),
                                            ),
                                          ),*/
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }
}
