import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'FirebaseErrorScreen.dart';

// class Update extends StatelessWidget {
//   const Update({super.key});

//   @override
//   Widget build(BuildContext context) {

//   getEser();

//     return Container();
//   }
// }
void getEser(code) async {
  var eser = FirebaseFirestore.instance
      .collection('tabiat-tarihi-data')
      .where('esernumarasi', isEqualTo: int.parse(code))
      .snapshots();
  print("AAAAAAAAAAAAA");
  var myMap = eser.forEach((element) {print(element)});
  // var sayi = myMap!['sayi'];
  // if (response.data()!.length != 0) {
  //   print("CCCCCCCCCC");
  //   eser.update({"sayi": sayi}).onError((error, stackTrace) => print(error));
  // }
  // print("Length" +  response.data()!.length.toString());
  // print("sayi" +  sayi.toString());
  print("code" +  code);

  print("BBBBBBBBBB ");
}
