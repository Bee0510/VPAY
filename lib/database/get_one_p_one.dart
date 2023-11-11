import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:v_pay/models/transaction_class.dart';

class getOnePOne {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<transaction>> getOnePone(String uid, String frnd) async {
    final pendingRequest = await _firestore
        .collection('transactions')
        .where('request_id', isEqualTo: uid)
        .where('payee_id', isEqualTo: frnd)
        .get();
    List<transaction> pendingRequestList = [];
    try {
      if (pendingRequest.docs.isNotEmpty) {
        for (var doc in pendingRequest.docs) {
          pendingRequestList.add(transaction(
            Transaction_id: doc['Transaction_id'],
            request_id: doc['request_id'],
            from_number: doc['from_number'],
            payee_id: doc['payee_id'],
            payee_name: doc['payee_name'],
            to_number: doc['to_number'],
            type: doc['type'],
            amount: doc['amount'],
            date: doc['date'].toDate(),
            reason: doc['reason'],
            location: doc['location'],
            isPaid: doc['isPaid'],
            paid_time: doc['paid_time'],
            isReceived: doc['isReceived'],
            received_time: doc['received_time'],
            img_url: doc['img_url'],
          ));
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return pendingRequestList;
  }
}
