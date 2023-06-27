import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tabiat_tarihi_app/main_page.dart';
import 'package:tabiat_tarihi_app/tab_navigation_item.dart';
import 'package:tabiat_tarihi_app/utils.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      /*options: DefaultFirebaseOptions.currentPlatform,*/
      );
  FirebaseFirestore.instance.clearPersistence();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  final CupertinoTabController _tabController =
      CupertinoTabController(initialIndex: 0);

  Future<bool> _onBackPressed() {
    debugPrint("MainScreen _onBackPressed");
    if (currentIndex != 0) {
      setState(() {
        currentIndex = 0;
        _tabController.index = 0;
      });
      return Future.value(false);
    } else
      return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: [
              for (final tabItem in TabNavigationItem.getTabItems(context))
                tabItem.page,
            ],
          ) /*MainPage()*/,
          bottomNavigationBar: buildBottomNavigationBar(
            context,
            currentIndex,
            (int index) => setState(() {
              currentIndex = index;
            }),
          ),
        ),
      ),
    );
  }
}
