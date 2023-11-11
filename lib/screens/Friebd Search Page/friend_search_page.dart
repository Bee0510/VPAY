// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:v_pay/auth/auth.dart';
import 'package:v_pay/screens/Request%20Screen/request_screen.dart';

import '../../models/user_class.dart';

class FriendListPage extends StatefulWidget {
  @override
  _FriendListPageState createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
  final Authentication auth = Authentication();
  List<Friend> friends = [];
  List<Friend> filteredFriends = [];
  final data = FirebaseAuth.instance.currentUser;

  Future<void> loadFriends() async {
    try {
      List<Friend> loadedFriend = await auth.getFriends(UserData(
          name: '', phone: data!.phoneNumber.toString(), uid: data!.uid));
      setState(() {
        friends = loadedFriend;
        filteredFriends = friends;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    loadFriends();
    filteredFriends.addAll(friends);
    super.initState();
  }

  void filterFriends(String query) {
    setState(() {
      filteredFriends = friends
          .where((friend) =>
              friend.name.toLowerCase().contains(query.toLowerCase()) ||
              friend.phone.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friend List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterFriends,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter name or phone number',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          filteredFriends.isEmpty
              ? Center(
                  child: Text(
                    'No Such friends to show',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: filteredFriends.length,
                    itemBuilder: (context, index) {
                      Friend friend = filteredFriends[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(friend.img_url),
                        ),
                        title: Text(friend.name),
                        subtitle: Text(friend.phone),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => request_screen(
                                    payee_id: friend.uid,
                                    Payee_no: friend.phone,
                                    payee_name: friend.name,
                                  )));
                        },
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
