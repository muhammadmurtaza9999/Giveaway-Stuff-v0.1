import 'package:flutter_gas/consts/consts.dart';

class FirestoreServices {
  //get users data
  static getUser(uid) {
    return firestore.collection(usersCollection).where('id', isEqualTo: uid).snapshots();
  }

  //get products according to category
  static getProducts(category) {
    return firestore.collection(productsCollection).where('p_category', isEqualTo: category).snapshots();
  }

  //grt request
  static getRequest(uid) {
    return firestore.collection(requestCollection).where('added_by',isEqualTo: uid).snapshots();
  }

  //delete Document
  static deleteDocument(docId) {
    return firestore.collection(requestCollection).doc(docId).delete();
  }

}