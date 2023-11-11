// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v_pay/auth/auth.dart';
import 'package:v_pay/database/database.dart';
import 'package:v_pay/models/auth_class.dart';
import 'package:v_pay/models/user_class.dart';
import 'package:v_pay/screens/Friebd%20Search%20Page/friend_search_page.dart';
import 'package:v_pay/screens/Home%20Screen/home_screen.dart';
import 'package:v_pay/screens/Payment%20Detailed%20Page/payment_detailed_screen.dart';
import 'package:v_pay/screens/Pending%20Payment%20Screen/pending_payment_screen.dart';
import 'package:v_pay/screens/Pending%20Screen/pending_screen.dart';
import 'package:v_pay/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    return MultiProvider(
      providers: [
        StreamProvider<Users?>.value(
          value: Authentication().UserDetails,
          initialData: null,
        ),
        StreamProvider<UserData?>.value(
          value: currentUser != null
              ? Database(uid: currentUser.uid).Userdata
              : null,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: 'splash_screen',
        routes: {
          'splash_screen': (context) => splash_screen(),
          'home_screen': (context) => home_screen(),
          '/pending': (context) => pending_screen(),
          '/pending_details': (context) => pending_details(),
          '/search_page': (context) => FriendListPage(),
          '/pending _payment': (context) => pending_payment_screen(),
        },
      ),
    );
  }
}
