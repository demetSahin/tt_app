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

  var eser = null;
  var id = null;
  await FirebaseFirestore.instance
      .collection("tabiat-tarihi-data")
      .where('esernumarasi', isEqualTo: int.parse(code))
      .get()
      .then(
    (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        eser = docSnapshot.data();
        id = docSnapshot.id;
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
    },
    onError: (e) => {print("Error completing: $e"), eser = null},
  );
  var collection = FirebaseFirestore.instance.collection('tabiat-tarihi-data').doc(id);
  if (eser != null) {
    collection.update({"sayi": eser['sayi'] + 1}).onError(
        (error, stackTrace) => print(error));
  }
}
