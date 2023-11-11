// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v_pay/database/get_one_p_one.dart';
import 'package:v_pay/models/transaction_class.dart';

import '../../models/user_class.dart';

class people_screen extends StatefulWidget {
  const people_screen({super.key, required this.frnd_uid});

  final String frnd_uid;

  @override
  State<people_screen> createState() => _people_screenState();
}

class _people_screenState extends State<people_screen> {
  final getOnePOne getonepone = getOnePOne();
  List<transaction> transactionsbtfrnd = [];

  Future<void> loadtransactions() async {
    try {
      List<transaction> loadedtransaction = await getonepone.getOnePone(
          FirebaseAuth.instance.currentUser!.uid, widget.frnd_uid);
      setState(() {
        transactionsbtfrnd = loadedtransaction;
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
    final userdata = Provider.of<UserData>(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 360,
                  height: 120,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 58, 57, 57),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(children: [
                          Text('12345',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 34)),
                          SizedBox(height: 10),
                          ElevatedButton(
                              onPressed: () {}, child: Text('Pay Now'))
                        ]),
                      ),
                      Container(
                        height: double.infinity,
                        width: 200,
                        child: Text(transactionsbtfrnd[0].payee_name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.clip)),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                width: 360,
                height: 600,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 58, 57, 57),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Recent:',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          TextButton(onPressed: () {}, child: Text('See All')),
                        ],
                      ),
                      Divider(thickness: 1, color: Colors.grey),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: transactionsbtfrnd.length,
                          itemBuilder: (context, i) {
                            return InkWell(
                              onTap: () {},
                              child: ListTile(
                                leading: Text(transactionsbtfrnd[i].amount,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: userdata.uid ==
                                                transactionsbtfrnd[i].payee_id
                                            ? Colors.red
                                            : Colors.green)),
                                title: Text(transactionsbtfrnd[i].reason,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                trailing: Text(
                                    transactionsbtfrnd[i].date.toString(),
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
