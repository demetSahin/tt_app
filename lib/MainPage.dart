import 'package:flutter/material.dart';
import 'Salon1.dart';
import 'Salon2.dart';
import 'Salon3.dart';
import 'Salon4.dart';
import 'Salon5.dart';
import 'Salon6.dart';
import 'istatistikler.dart';
import 'utils.dart';
import 'QRViewExample.dart';

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
                    // width: double.infinity,
                    child: Container(
                      // width: double.infinity,
                      height: 896 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36 * fem),
                      ),
                      child: Container(
                        // homePHV (33:699)
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xfff6f5f5),
                          borderRadius: BorderRadius.circular(36 * fem),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              // image36Bu (1263:184)
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
                              // group178eP (1462:350)
                              left: 29 * fem,
                              top: 34 * fem,
                              child: Container(
                                width: 356 * fem,
                                height: 843 * fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // tabiattarihimerkeziQ67 (1272:189)
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
                                      /*margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 80 * fem),*/
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
                                                      const QRViewExample(),
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
                                                          const Salon1(),
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
                                                      Image.asset(
                                                        'assets/screens/images/open-door-1.png',
                                                        width: 80,
                                                        height: 80,
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
                                                          const Salon2(),
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
                                                      Image.asset(
                                                        'assets/screens/images/stone-1.png',
                                                        width: 80,
                                                        height: 80,
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
                                                          const Salon3(),
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
                                                      Image.asset(
                                                        'assets/screens/images/fossil-1.png',
                                                        width: 80,
                                                        height: 80,
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
                                                          const Salon4(),
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
                                                      Image.asset(
                                                        'assets/screens/images/evolution-1.png',
                                                        width: 80,
                                                        height: 80,
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
                                                          const Salon5(),
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
                                                      Image.asset(
                                                        'assets/screens/images/birds-1.png',
                                                        width: 80,
                                                        height: 80,
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
                                                          const Salon6(),
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
                                                      Image.asset(
                                                        'assets/screens/images/elephant.png',
                                                        width: 80,
                                                        height: 80,
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
                                          SizedBox(height: 24 * fem),
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
                                          ),
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
