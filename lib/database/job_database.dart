import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_searching_app/database/auth.dart';

// Connect with Job database
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('jobs');

class JobDatabase {

  // Add data to the database
  static Future <void> addItem({
    required int jobId,
    required String company,
    required String logoUrl,
    required String title,
    required String location,
    required String time,
    required List <String> req
}) async {
    print('this is');
    print(Auth().getCurrentUserEmail());
    DocumentReference documentReference = _mainCollection.doc(Auth().getCurrentUserEmail()).collection('application').doc();

    Map<String, dynamic> data = <String, dynamic> {
      'jobId' : jobId,
      'company' : company,
      'logoUrl' : logoUrl,
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
    CollectionReference jobsItemCollection = _mainCollection.doc(Auth().getCurrentUserEmail()).collection('application');

    return jobsItemCollection.snapshots();
  }

  static Future<void> deleteItems({
    required String jobId
}) async {
    DocumentReference documentReference = _mainCollection.doc(Auth().getCurrentUserEmail()).collection('application').doc(jobId);

    await documentReference.delete().whenComplete( () =>
      print('Jobs delete from db')
    ).catchError( (e) =>
      print(e)
    );
  }

}