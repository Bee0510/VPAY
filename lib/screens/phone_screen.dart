// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:v_pay/auth/auth.dart';
import 'package:v_pay/screens/verify_screen.dart';

class phone_screen extends StatefulWidget {
  const phone_screen({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<phone_screen> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<phone_screen> {
  TextEditingController countryController = TextEditingController();
  final Authentication auth = Authentication();
  var phone = "";

  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "V Pay",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone number before getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        phone = value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone",
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      auth.phoneSignIn(
                          phoneNumber: phone, country: countryController.text);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MyVerify()));
                    },
                    child: Text("Send the code")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
