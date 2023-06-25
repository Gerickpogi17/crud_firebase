

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_gerick/pages/export_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PatientController {
final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

final String _collectionPath = "patient";

 CollectionReference get _collection {
    return _firestoreInstance.collection(_collectionPath);
  }

Future<List<User>> get() async {
  List<User> users = [];

  try {
    final dataVal = await FirebaseFirestore.instance.collection(_collectionPath).get();

    for (var element in dataVal.docs) {
      users.add(User.fromJson(element.data()));
    }

    return users;
  } catch (e) {
    if (e is FirebaseException && kDebugMode) {
      debugPrint('Failed with error "${e.code}": ${e.message}');
    } else {
      throw Exception(e.toString());
    }

    return users; // Return empty list in case of error
  }
}



  //   Future<void> add( User patient ) async {

  //   String? id = patient.id;

  //   Map<String, dynamic> data = patient.data;
    
  //   data.addAll({
  //     "date_created" : FieldValue.serverTimestamp(),
  //     "date_modified" : FieldValue.serverTimestamp(),
  //   });

  //   DocumentReference patientRef = _collection.doc( id );

  //   await patientRef.set( data );
  // }
}