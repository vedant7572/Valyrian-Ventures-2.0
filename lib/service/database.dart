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

  updataUserWallet(String Id, String amount) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .update({"Wallet": amount});
  }

  Future addItem(Map<String, dynamic> userInfoMap, String name) async {
    return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
  }

}
