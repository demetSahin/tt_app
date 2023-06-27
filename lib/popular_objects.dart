import 'package:flutter/material.dart';
import 'package:tabiat_tarihi_app/item_model.dart';
import 'package:tabiat_tarihi_app/utils.dart';

class PopularObjects extends StatefulWidget {
  const PopularObjects({super.key});

  @override
  State<PopularObjects> createState() => _PopularObjectsState();
}

class _PopularObjectsState extends State<PopularObjects> {
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
              "Popüler Objeler",
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
                      /*.orderBy('visits', descending: true)*/
                      .where('order', isGreaterThanOrEqualTo: 7)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List list = snapshot.data!.docs.toList();
                      List<ItemModel> objectsList = [];
                      for (int i = 0; i < list.length; ++i) {
                        objectsList.add(ItemModel(
                          key: UniqueKey(),
                          name: list[i]["name"],
                          imagePath: list[i]["imagePath"],
                          visits: list[i]["visits"],
                        ));
                      }
                      objectsList.sort(
                          (a, b) => b.visits.length.compareTo(a.visits.length));

                      return Material(
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
                                  itemCount: objectsList.length,
                                  itemBuilder: (context, index) {
                                    return objectsList[index];
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
