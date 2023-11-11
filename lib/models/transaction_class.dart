// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class transaction {
  final String Transaction_id;
  final String request_id;
  final String from_number;
  final String payee_id;
  final String payee_name;
  final String to_number;
  final String type;
  final String amount;
  final DateTime date;
  final String reason;
  final String location;
  final bool isPaid;
  final String paid_time;
  final bool isReceived;
  final String received_time;
  final List img_url;

  transaction({
    required this.Transaction_id,
    required this.request_id,
    required this.payee_id,
    required this.payee_name,
    required this.type,
    required this.amount,
    required this.date,
    required this.from_number,
    required this.to_number,
    String? reason,
    String? location,
    required this.isPaid,
    required this.paid_time,
    required this.isReceived,
    required this.received_time,
    List? img_url,
  })  : reason = reason ?? '',
        location = location ?? '',
        img_url = img_url ?? [];
}
