import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:v_pay/models/user_class.dart';

class Database {
  final String uid;
  Database({required this.uid});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserData userDataFromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    final List<Map<String, dynamic>> friendsData = data['friends'] != null
        ? List<Map<String, dynamic>>.from(data['friends'])
        : [];
    return UserData(
      uid: data['uid'],
      name: data['name'],
      phone: data['phoneNumber'],
      friends: friendsData,
      img_url: data['img_url'],
    );
  }

  Stream<UserData> get Userdata {
    return _firestore
        .collection('users')
        .doc(uid)
        .snapshots()
        .map(userDataFromSnapshot);
  }
}
