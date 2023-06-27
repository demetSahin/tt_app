import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabiat_tarihi_app/popular_objects.dart';
import 'main_page.dart';
import 'istatistikler.dart';

class TabNavigationItem {
  final context;
  final Widget page;
  final Widget title;
  final String label;
  final Widget icon;

  TabNavigationItem({
    this.context,
    required this.page,
    required this.title,
    required this.label,
    required this.icon,
  });

  static List<TabNavigationItem> getTabItems(context) {
    return [
      TabNavigationItem(
        page: MainPage(),
        icon: Icon(Icons.home_outlined),
        label: "Ana Sayfa",
        title: Text(
          "Ana Sayfa",
        ),
      ),
      TabNavigationItem(
        page: Istatistikler(),
        icon: Icon(Icons.stacked_line_chart),
        label: "İstatistikler",
        title: Text(
          "İstatistikler",
        ),
      ),
      TabNavigationItem(
        page: PopularObjects(),
        icon: Icon(Icons.favorite_sharp),
        label: "Popüler Objeler",
        title: Text(
          "Popüler Objeler",
        ),
      ),
    ];
  }
}
