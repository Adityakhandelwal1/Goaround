import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreManager {
  final CollectionReference profileList = FirebaseFirestore.instance.collection('Recommend');

  // Future<void> createUserData(
  //     String name, String gender, int score, String uid) async {
  //   return await profileList
  //       .document(uid)
  //       .setData({'name': name, 'gender': gender, 'score': score});
  // }
  //
  // Future updateUserList(String name, String gender, int score, String uid) async {
  //   return await profileList.document(uid).updateData({
  //     'name': name, 'gender': gender, 'score': score
  //   });
  // }

  Future getUsersList() async {
    List itemsList = [];

    try {
      StreamBuilder(
          stream: profileList.snapshots(),
        builder: (context, snapshot){
            if(!snapshot.hasData) return Text('Loading data...');
            return Column(
              children: <Widget>[
                Text(snapshot.data.documents[0]['name']),
              ],
            );
        },

      );


      // await profileList.getDocuments().then((querySnapshot) {
      //   querySnapshot.documents.forEach((element) {
      //     itemsList.add(element.data);
      //   });
      // });
      // return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}