import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Description extends StatefulWidget {
  const Description({super.key, required this.salon});
  final String salon;

  static final _db = FirebaseFirestore.instance;

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  FlutterTts tts = FlutterTts();
  bool playing = true, firstPlay = true;
  late Widget button;

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
    String aciklama = "Açıklama";
    String baslik = "Başlık";
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('aciklamalar')
          .where('id', isEqualTo: int.parse(widget.salon))
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');

        if (snapshot.hasData) {
          debugPrint("salon : ${widget.salon}");
          var myMap = snapshot.data?.docs.toList().first;
          baslik = myMap!["name"];
          aciklama = myMap["description"];
          return Scaffold(
            appBar: AppBar(
              title: Text(baslik),
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
                              16.0,
                              16.0,
                              16.0,
                              80.0,
                            ),
                            child: Text(
                              aciklama,
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
                            await tts.speak(aciklama);
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
                            await tts.speak(aciklama);
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
