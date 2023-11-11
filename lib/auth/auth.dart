// ignore_for_file: unused_element, non_constant_identifier_names, unused_field, unnecessary_null_comparison, empty_catches, avoid_print, unused_local_variable, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:v_pay/models/user_class.dart';
import 'package:v_pay/screens/phone_screen.dart';
import '../models/auth_class.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Users? _FromFirebaseUser(User? user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  Stream<Users?> get UserDetails {
    return _auth.authStateChanges().map(_FromFirebaseUser);
  }

  Future<void> phoneSignIn(
      {required String phoneNumber, required String country}) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '${country + phoneNumber}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        phone_screen.verify = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future VerifyOTP(String Phone, String code) async {
    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: Phone, smsCode: code);

      UserCredential Result = await _auth.signInWithCredential(credential);

      User? users = Result.user;
      final userData = await getUserDataFromFirebase(users!);
      if (userData != null) {
        Fluttertoast.showToast(
          msg: 'Welcome Back',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        return _FromFirebaseUser(users);
      } else {
        await _registerUser(users);
        Fluttertoast.showToast(
          msg: 'Welcome',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        return _FromFirebaseUser(users);
      }
    } catch (e) {
      print('Phone verification failed: ' + e.toString());
      Fluttertoast.showToast(
        msg: "Phone verification failed: $e",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
      );
    }
  }

  Future<void> _registerUser(User user) async {
    await _firestore.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'name': 'Vishal Behera',
      'phoneNumber': user.phoneNumber,
      'friends': [],
      'img_url': '',
    });
  }

  //Adding a friend
  Future<void> addFriend(UserData? user, String friendId) async {
    final userRef = _firestore.collection('users').doc(user!.uid);
    final friendRef = _firestore.collection('users').doc(friendId);

    // Get data of the friend
    final friendDoc = await friendRef.get();
    final friendData = friendDoc.data() as Map<String, dynamic>;

    // Create a map for the friend
    final friend = {
      'uid': friendData['uid'],
      'name': friendData['name'],
      'phoneNumber': friendData['phoneNumber'],
      'img_url': friendData['img_url'],
    };

    // Update the current user's friends list
    await userRef.update({
      'friends': FieldValue.arrayUnion([friend])
    });

    // Update the friend's friends list with the current user
    await friendRef.update({
      'friends': FieldValue.arrayUnion([
        {
          'uid': user.uid,
          'name': user.name,
          'phoneNumber': user.phone,
          'img_url': user.img_url,
        }
      ])
    });
  }

  Future<List<Friend>> getFriends(UserData user) async {
    DocumentReference userRef = _firestore.collection('users').doc(user.uid);
    DocumentSnapshot snapshot = await userRef.get();

    List<Friend> friends = [];
    for (Map<String, dynamic> friendMap in snapshot['friends']) {
      friends.add(Friend(
          uid: friendMap['uid'],
          name: friendMap['name'],
          phone: friendMap['phoneNumber'],
          img_url: friendMap['img_url']));
    }
    return friends;
  }

  Future<Map<String, dynamic>?> getUserDataFromFirebase(User user) async {
    final userref = _firestore.collection('users').doc(user.uid);
    final userDoc = await userref.get();
    if (userDoc.exists) {
      print(userDoc.data());
      return userDoc.data() as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  Future LogOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
