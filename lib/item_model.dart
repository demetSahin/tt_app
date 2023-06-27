import 'package:flutter/material.dart';
import 'package:tabiat_tarihi_app/chart.dart';

class ItemModel extends StatefulWidget {
  const ItemModel({
    required Key key,
    required this.name,
    required this.imagePath,
    required this.visits,
  }) : super(key: key);

  final String name, imagePath;
  final List visits;

  @override
  State<ItemModel> createState() => _ItemModelState();
}

class _ItemModelState extends State<ItemModel> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Chart(
              visits: widget.visits,
              name: widget.name,
              imagePath: widget.imagePath,
            ),
          ),
        );
      },
      child: Material(
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
              child: Hero(
                tag: widget.name,
                child: Image.asset(
                  widget.imagePath,
                ),
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
                "${(widget.visits.length)}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
