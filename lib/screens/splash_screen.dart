import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v_pay/models/auth_class.dart';
import 'package:v_pay/screens/Home%20Screen/home_screen.dart';
import 'package:v_pay/screens/phone_screen.dart';

class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);

    if (user == null) {
      return phone_screen();
    } else {
      return home_screen();
    }
  }
}
