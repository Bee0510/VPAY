// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:v_pay/models/user_class.dart';

import '../../models/auth_class.dart';

class adv_section extends StatelessWidget {
  const adv_section({
    super.key,
    required this.user,
  });

  final UserData? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://cubicleninjas.com/wp-content/uploads/2019/09/motion-graphics-examples.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      width: double.infinity,
      height: 200,
      child: Center(
        child: Text(user!.uid),
      ),
    );
  }
}
