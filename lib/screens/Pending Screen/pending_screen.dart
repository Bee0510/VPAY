// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class pending_screen extends StatefulWidget {
  const pending_screen({super.key});

  @override
  State<pending_screen> createState() => _pending_screenState();
}

class _pending_screenState extends State<pending_screen> {
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
              Text('Pending Payments',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              SizedBox(height: 10),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
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
                          // border: Border(
                          //   bottom: BorderSide(color: Colors.grey, width: 0),
                          //   top: BorderSide(color: Colors.grey, width: 1),
                          //   left: BorderSide(color: Colors.grey, width: 1),
                          //   right: BorderSide(color: Colors.grey, width: 1),
                          // ),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/1.jpg'),
                              ),
                              title: Text('Vishal Behera',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              subtitle: Text('12/12/2021',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey)),
                              trailing: Text('456',
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
