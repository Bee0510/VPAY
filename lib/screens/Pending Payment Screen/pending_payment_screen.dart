// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:v_pay/database/get_pending_request.dart';
import 'package:v_pay/models/transaction_class.dart';

class pending_payment_screen extends StatefulWidget {
  const pending_payment_screen({super.key});

  @override
  State<pending_payment_screen> createState() => _pending_screenState();
}

class _pending_screenState extends State<pending_payment_screen> {
  final pending_request requets = pending_request();
  List<transaction> transactions = [];

  final data = FirebaseAuth.instance.currentUser;

  Future<void> loadtransactions() async {
    try {
      List<transaction> loadedtransaction =
          await requets.getPendingRequest(data!.uid);
      setState(() {
        transactions = loadedtransaction;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    loadtransactions();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1A1A1A),
                Color(0xFF333333),
              ],
            ),
          ),
          child: Column(
            children: [
              Text('Pending Payments Request',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              SizedBox(height: 10),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/pending_details');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/1.jpg'),
                              ),
                              title: Text(transactions[index].payee_name,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              subtitle: Text(
                                  transactions[index].date.toString(),
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey)),
                              trailing: Text('₹ ${transactions[index].amount}',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
