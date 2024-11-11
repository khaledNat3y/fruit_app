import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_app/features/auth/data/models/user_model.dart';
import 'package:fruits_app/features/auth/domain/entities/user_entity.dart';

import 'data_base_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;

  @override
  Future<void> addData({required String path, required Map<String,
      dynamic> data, required String? documentId}) async {
    if (documentId != null) {
      await fireStoreInstance.collection(path).doc(documentId).set(data);
    }else {
      await fireStoreInstance.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId}) async {
    CollectionReference collection = fireStoreInstance.collection(path);
    DocumentReference documentReference = collection.doc(documentId);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    return documentSnapshot.data() as Map<String, dynamic>;
  }
  @override
  Future<bool> checkIfDataExists({required String path, required String documentId}) async {
    var data = await fireStoreInstance.collection(path).doc(documentId).get();
    return data.exists;
  }
}
