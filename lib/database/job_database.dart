import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('jobs');
final userId = FirebaseAuth.instance.currentUser?.email;

class JobDatabase {
  // static String? userId;

  static Future <void> addItem({
    required int jobId,
    required String company,
    required String logoUrl,
    required bool isMark,
    required String title,
    required String location,
    required String time,
    required List <String> req
}) async {
    DocumentReference documentReference = _mainCollection.doc(userId as String?).collection('application').doc();

    Map<String, dynamic> data = <String, dynamic> {
      'jobId' : jobId,
      'company' : company,
      'logoUrl' : logoUrl,
      'isMark' : isMark,
      'title' : title,
      'location' : location,
      'time' : time,
      'req' : req,
    };
    await documentReference.set(data).whenComplete(() =>
      print('Job insert to the database')).catchError((e) =>
      print(e)
    );
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference jobsItemCollection = _mainCollection.doc(userId as String?).collection('application');

    return jobsItemCollection.snapshots();
  }
}