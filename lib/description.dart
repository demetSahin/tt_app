import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:tabiat_tarihi_app/utils.dart';
import 'firebase_error_screen.dart';

class Description extends StatefulWidget {
  const Description({super.key, required this.salon});

  final String salon;

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  FlutterTts tts = FlutterTts();
  bool playing = true, firstPlay = true;
  late Widget button;
  bool run = true;

  @override
  void initState() {
    super.initState();
    button = Image.asset(
      'assets/screens/images/play.png',
      fit: BoxFit.cover,
    );
  }

  @override
  void dispose() {
    super.dispose();
    tts.stop();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    String eseradi = "Açıklama";
    String eseraciklamasi = "Başlık";
    /*int eserSayisi;*/
    return StreamBuilder<QuerySnapshot>(
      stream: visitorRef
          .where('order', isEqualTo: int.parse(widget.salon))
          .snapshots(),
      /*FirebaseFirestore.instance
          .collection('tabiat-tarihi-data')
          .where('esernumarasi', isEqualTo: int.parse(widget.salon))
          .snapshots(),*/
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');

        if (snapshot.hasData) {
          debugPrint("salon : ${widget.salon}");
          if ((snapshot.data!).docs.length == 0) {
            return Center(
              child: FirebaseErrorScreen(),
            );
          }

          var myMap = snapshot.data?.docs.toList().first;
          eseradi = /*myMap!["eseradi"]*/ myMap!["name"];
          eseraciklamasi = /*myMap["eseraciklamasi"]*/ myMap["description"];
          /*eserSayisi = myMap["sayi"] + 1;*/
          //debugPrint("id: ${}");

          if (run) {
            var visits = myMap["visits"];

            int visitors = visits.length;
            visits.add({
              'visitNumber': visitors + 1,
              'visitTime': DateTime.now(),
            });
            run = false;
            updateVisitors(
              myMap["id"],
              visits,
            );
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(190, 232, 246, 1),
              leading: BackButton(
                color: Color(0xff252468),
              ),
              /*leading: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Hero(
                  tag: myMap["id"],
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(252, 215, 157, 1),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      border: Border.all(),
                    ),
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      myMap["imagePath"],
                    ),
                  ),
                ),
              ),*/
              title: Text(
                eseradi,
                style: SafeGoogleFont(
                  'Josefin Sans',
                  fontSize: 30 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1 * ffem / fem,
                  color: Color(0xff252468),
                ),
              ),
            ),
            body: Stack(
              children: [
                CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              20.0,
                              32.0,
                              20.0,
                              80.0,
                            ),
                            child: Text(
                              eseraciklamasi,
                              textAlign: TextAlign.justify,
                              style: SafeGoogleFont(
                                'Josefin Sans',
                                fontSize: 26 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1 * ffem / fem,
                                color: Color(0xff252468),
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Material(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          40.0,
                        ),
                      ),
                      elevation: 4.0,
                      child: GestureDetector(
                        child: Container(
                          color: const Color(
                            0xff296389,
                          ),
                          height: 56.0,
                          alignment: Alignment.bottomCenter,
                          child: ListTile(
                            leading: button,
                            title: const Text(
                              'DİNLE',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onTap: () async {
                          if (firstPlay == true) {
                            button = Image.asset(
                              'assets/screens/images/pause.png',
                              fit: BoxFit.cover,
                            );
                            setState(() {});
                            await tts.setLanguage("tr-TR");
                            await tts.speak(eseraciklamasi);
                            firstPlay = false;
                          } else if (playing == true) {
                            button = Image.asset(
                              'assets/screens/images/play.png',
                              fit: BoxFit.cover,
                            );
                            setState(() {});
                            await tts.pause();
                            playing = false;
                          } else {
                            button = Image.asset(
                              'assets/screens/images/pause.png',
                              fit: BoxFit.cover,
                            );
                            setState(() {});
                            await tts.speak(eseraciklamasi);
                            playing = true;
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
