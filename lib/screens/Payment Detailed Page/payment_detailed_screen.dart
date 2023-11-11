// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../Request Screen/request_screen.dart';
import '../Request Screen/sending_to_details.dart';

class pending_details extends StatefulWidget {
  const pending_details({super.key});

  @override
  State<pending_details> createState() => _pending_detailsState();
}

class _pending_detailsState extends State<pending_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
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
                  SizedBox(height: 100),
                  sending_to_details(name: 'Requested by', phone: '9078545133'),
                  SizedBox(height: 20),
                  Text('₹ 1000',
                      style: TextStyle(color: Colors.white, fontSize: 34)),
                  SizedBox(height: 20),
                  Text('Add a note',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(height: 20),
                  Text('location',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 350,
                height: 100,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.red,
                              child: Icon(Icons.close),
                            ),
                            Text('Reject'),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.green,
                              child: Icon(Icons.check),
                            ),
                            Text('Accept'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
