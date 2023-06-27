import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:tabiat_tarihi_app/utils.dart';

class Salon extends StatefulWidget {
  const Salon(
      {super.key,
      required this.title,
      required this.id,
      required this.imagePath});

  final String title, id, imagePath;

  @override
  State<Salon> createState() => _SalonState();
}

class _SalonState extends State<Salon> {
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
    bool run = true;
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(190, 232, 246, 1),
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Hero(
            tag: widget.id,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(252, 215, 157, 1),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.all(),
              ),
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                widget.imagePath,
              ),
            ),
          ),
        ),
        title: Text(
          widget.title,
          style: SafeGoogleFont(
            'Josefin Sans',
            fontSize: 30 * ffem,
            fontWeight: FontWeight.w700,
            height: 1 * ffem / fem,
            color: Color(0xff252468),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: visitorRef.where('name', isEqualTo: widget.title).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List list = snapshot.data!.docs.toList();
            String description_ = list[0]["description"];
            if (run) {
              List visits = list[0]["visits"];
              int visitors = visits.length;
              visits.add({
                'visitNumber': visitors + 1,
                'visitTime': DateTime.now(),
              });
              run = false;
              updateVisitors(
                widget.id,
                visits,
              );
            }

            return Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      20.0,
                      32.0,
                      20.0,
                      80.0,
                    ),
                    child: Text(
                      description_,
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
                            await tts.speak(description_);
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
                            await tts.speak(description_);
                            playing = true;
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
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
