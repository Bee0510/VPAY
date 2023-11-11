// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class sending_to_details extends StatelessWidget {
  const sending_to_details({
    super.key,
    required this.name,
    required this.phone,
  });
  final String name;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.GlXqxcR9EmviN5kuwaUsMQHaIB%26pid%3DApi&f=1&ipt=4819026fc22cb62593125dbd818b4106be5a0235b70264c0f980aa168bd8dbd4&ipo=images'),
            ),
            SizedBox(height: 20),
            Text(name, style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(height: 5),
            Text(phone, style: TextStyle(color: Colors.white, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
