import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

//changes aataa
class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String Id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(Id)
        .set(userInfoMap);
  }

  Future addFoodToCart(Map<String, dynamic> userInfoMap, String Id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(Id)
        .collection("cart")
        .doc()
        .set(userInfoMap);
  }

  updataUserWallet(String Id, String amount) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .update({"Wallet": amount});
  }

  Future addItem(Map<String, dynamic> userInfoMap, String name) async {
    return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getItem(String name) async {
    return await FirebaseFirestore.instance
        .collection(name)
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> getFoodCart(String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("cart")
        .snapshots();
  }

  Future<void> deleteCart(String userId) async {
    final CollectionReference cartCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart');

    WriteBatch batch = FirebaseFirestore.instance.batch();

    QuerySnapshot cartSnapshot = await cartCollection.get();
    for (QueryDocumentSnapshot doc in cartSnapshot.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
  }
}
