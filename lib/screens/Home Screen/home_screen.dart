// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v_pay/auth/auth.dart';
import 'package:v_pay/database/get_pending_request.dart';
import 'package:v_pay/database/transaction_base.dart';
import 'package:v_pay/models/user_class.dart';
import 'package:v_pay/screens/Home%20Screen/fun_section.dart';
import 'package:v_pay/screens/Home%20Screen/people_section.dart';

import 'adv_section.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  final Authentication auth = Authentication();
  final transaction_base transactionBase = transaction_base();
  final pending_request requets = pending_request();

  List<Friend> friends = [];
  final data = FirebaseAuth.instance.currentUser;

  Future<void> loadFriends() async {
    try {
      List<Friend> loadedFriend = await auth.getFriends(UserData(
          name: '', phone: data!.phoneNumber.toString(), uid: data!.uid));
      setState(() {
        friends = loadedFriend;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    loadFriends();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData?>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 43, 37, 37),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              adv_section(user: userData!),
              SizedBox(height: 5),
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    ElevatedButton(
                        onPressed: () async {
                          await auth.LogOut();
                        },
                        child: Text('Log out')),
                    funSection(),
                    SizedBox(height: 8),
                    PeopleSection(peopleList: friends),
                    ElevatedButton(
                      onPressed: () async {
                        // await auth.addFriend(
                        //     userData, 'wi6FZ2ttO8h82ccxrtTNzsSorhB3');
                        // await transactionBase.requestMoney(
                        //     userData,
                        //     'byqedbyqd',
                        //     '100',
                        //     '9078545133',
                        //     'Paratha',
                        //     'HB jbh');
                        // await auth.getFriends(userData);
                        await requets.getPendingRequest(userData.uid);
                      },
                      child: Text('Add a friend'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
