import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ///* GET data once from a specified path
  getData(String collectionPath) async {
    assert(collectionPath.isNotEmpty);
    final doc = await firestore.doc(collectionPath).get();
    return doc.data();
  }

  ///* GET stream of specified collection
  Stream<QuerySnapshot> getStream(String collectionPath) {
    assert(collectionPath.isNotEmpty);
    return firestore.collection(collectionPath).snapshots();
  }

  ///* GET stream of specified collection with query
  Stream<QuerySnapshot<Map<String, dynamic>?>> getStreamWhere(
      String collectionPath, String key, dynamic value) {
    assert(collectionPath.isNotEmpty);
    return firestore
        .collection(collectionPath)
        .where(key, isEqualTo: value)
        .snapshots();
  }

  ///* UPDATE or INSERT data to a specified path
  Future<void> upsert(String path, Map<String, dynamic> data) async {
    assert(path.isNotEmpty && data.isNotEmpty);
    await firestore.doc(path).set(data, SetOptions(merge: true));
  }

  ///* DELETE data from the specified path
  Future<void> delete(String path) async {
    assert(path.isNotEmpty);
    await firestore.doc(path).delete();
  }
}
