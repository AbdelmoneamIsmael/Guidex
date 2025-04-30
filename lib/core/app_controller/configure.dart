import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Configure {
  String doc = 'CyLukrG5emuux2BKkNEY';
  String collection = 'AppConfigure';
  Stream<DocumentSnapshot<Map<String, dynamic>>> checkAvilability() {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(doc)
        .snapshots();
  }
}
