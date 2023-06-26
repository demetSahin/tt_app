import 'package:flutter/material.dart';

//ignore: must_be_immutable
class SalonItem extends StatefulWidget {
  SalonItem({
    required Key key,
    required this.name,
    required this.visitors,
    required this.imagePath,
  }) : super(key: key);

  final String name, imagePath;
  int visitors;

  @override
  State<SalonItem> createState() => _SalonItemState();
}

class _SalonItemState extends State<SalonItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 6,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: const BorderRadius.all(
        Radius.circular(
          12.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
          leading: Container(
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
          title: Text(
            widget.name,
          ),
          trailing: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(190, 232, 246, 1),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(),
            ),
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "${(widget.visitors)}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
