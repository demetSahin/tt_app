import 'package:flutter/material.dart';
import 'package:tabiat_tarihi_app/salon_item.dart';
import 'package:tabiat_tarihi_app/utils.dart';

class Istatistikler extends StatefulWidget {
  const Istatistikler({super.key});

  @override
  State<Istatistikler> createState() => _IstatistiklerState();
}

class _IstatistiklerState extends State<Istatistikler> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32.0),
            Text(
              "Salon Ziyaretçi Sayıları",
              style: SafeGoogleFont(
                'Josefin Sans',
                fontSize: 30 * ffem,
                fontWeight: FontWeight.w700,
                height: 1 * ffem / fem,
                color: Color(0xff252468),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: StreamBuilder(
                  stream: visitorRef
                      .orderBy('visitor', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List list = snapshot.data!.docs.toList();

                      return Expanded(
                        child: Material(
                          color: Colors.white,
                          elevation: 6,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              24.0,
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics(),
                                    ),
                                    shrinkWrap: true,
                                    itemCount: list.length,
                                    itemBuilder: (context, index) {
                                      return SalonItem(
                                        key: UniqueKey(),
                                        name: list[index]["name"],
                                        visitors: list[index]["visitor"],
                                        imagePath: list[index]["imagePath"],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            const Divider(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            /*buildResponsive(size, cardList),*/
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
