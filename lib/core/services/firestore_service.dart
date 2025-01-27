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
  Future<dynamic> getData(
      {required String path, String? documentId, Map<String,dynamic>? query}) async {
    if(documentId != null) {
      var data = await fireStoreInstance.collection(path).doc(documentId).get();
      return data.data();
    }else {
      Query<Map<String,dynamic>> data =  fireStoreInstance.collection(path);
      if(query != null) {
        if(query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByField, descending: descending);
        }
        if(query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }

      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }
  @override
  Future<bool> checkIfDataExists({required String path, required String documentId}) async {
    var data = await fireStoreInstance.collection(path).doc(documentId).get();
    return data.exists;
  }
}
