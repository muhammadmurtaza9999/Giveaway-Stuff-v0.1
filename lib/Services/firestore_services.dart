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

  //get order
  static getOrder(uid) {
    return firestore.collection(orderCollection).where('added_by',isEqualTo: uid).snapshots();
  }

  //delete Document
  static deleteDocument(docId) {
    return firestore.collection(orderCollection).doc(docId).delete();
  }

  //get all chat messages
  static getChatMessages(docId) {
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy("created_on", descending: false)
        .snapshots();
  }

   static getAllOrders() {
    return firestore.collection(ordersCollection).where('order_by', isEqualTo: currentUser!.uid).snapshots();
   }

   static getwishlists(){
    return firestore.collection(productsCollection).where('p_wishlist', arrayContains: currentUser!.uid).snapshots();
   }

   static getAllmessages(){
     return firestore.collection(chatsCollection).where('fromId', isEqualTo: currentUser!.uid).snapshots();
   }

   static getCounts() async {
    var res = await Future.wait([
      firestore.collection(cart).where('added_by', isEqualTo: currentUser!.uid).get().then((value) {
      // firestore.collection(cartCollection).where('added_by', isEqualTo: currentUser!.uid).get().then((value) {
        return value.docs.length;
      }),
      firestore.collection(productsCollection).where('p_wishlist', arrayContains: currentUser!.uid).get().then((value) {
        // firestore.collection(cartCollection).where('added_by', isEqualTo: currentUser!.uid).get().then((value) {
        return value.docs.length;
      }),
      firestore.collection(ordersCollection).where('order_by', arrayContains: currentUser!.uid).get().then((value) {
        // firestore.collection(cartCollection).where('added_by', isEqualTo: currentUser!.uid).get().then((value) {
        return value.docs.length;
      })
    ]);
    return res;
   }
   
}