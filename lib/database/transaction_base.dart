// ignore_for_file: unused_field, unused_element

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:v_pay/models/user_class.dart';

class transaction_base {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String generateRandomUid() {
    Random random = Random();
    List<int> uidDigits = List.generate(16, (index) => random.nextInt(10));
    String uid = uidDigits.join();
    return uid;
  }

  //Requesting Money
  Future<void> requestMoney(
      UserData user,
      String userid2,
      String amount,
      String tonumber,
      String reason,
      String location,
      String payee_name) async {
    String randomid = generateRandomUid();
    await _firestore.collection('transactions').doc().set({
      'Transaction_id': randomid,
      'request_id': user.uid,
      'from_number': user.phone,
      'payee_id': userid2,
      'payee_name': payee_name,
      'to_number': tonumber,
      'type': 'request',
      'amount': amount,
      'date': DateTime.now(),
      'reason': reason,
      'location': location,
      'isPaid': false,
      'paid_time': '',
      'isReceived': false,
      'received_time': '',
      'img_url': [],
    });
  }
}
