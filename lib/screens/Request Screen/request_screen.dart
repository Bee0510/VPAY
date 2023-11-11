// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v_pay/database/transaction_base.dart';
import 'package:v_pay/models/user_class.dart';
import 'package:v_pay/screens/Request%20Screen/bill_upload.dart';

import 'form_field.dart';
import 'sending_to_details.dart';
import 'value_text_field.dart';

class request_screen extends StatefulWidget {
  const request_screen(
      {Key? key,
      required this.payee_id,
      required this.Payee_no,
      required this.payee_name})
      : super(key: key);
  final String payee_id;
  final String Payee_no;
  final String payee_name;

  @override
  State<request_screen> createState() => _request_screenState();
}

class _request_screenState extends State<request_screen> {
  final _formKey = GlobalKey<FormState>();
  final transaction_base transaction = transaction_base();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  Widget build(BuildContext context) {
    final userdata = Provider.of<UserData>(context);
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    sending_to_details(
                      name: 'Requesting From ${widget.payee_name}',
                      phone: widget.Payee_no,
                    ),
                    SizedBox(height: 20),
                    value_text_field(valueController: _valueController),
                    SizedBox(height: 20),
                    form_field(
                        noteController: _noteController, hint: 'Add a note'),
                    SizedBox(height: 20),
                    form_field(
                        noteController: _locationController, hint: 'location'),
                    SizedBox(height: 20),
                    bill_upload(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: buttons(
                    width: double.infinity,
                    height: 50,
                    text: 'Request',
                    fontsize: 20,
                    onPressed: () async {
                      await transaction.requestMoney(
                          userdata,
                          widget.payee_id,
                          _valueController.text,
                          widget.Payee_no,
                          _noteController.text,
                          _locationController.text,
                          widget.payee_name);
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                      Timer(Duration(seconds: 1), () {
                        Navigator.pop(context);
                      });
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class buttons extends StatelessWidget {
  const buttons({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.fontsize,
    required this.onPressed,
  });
  final double width;
  final double height;
  final String text;
  final double fontsize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[800],
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: fontsize, color: Colors.white),
        )),
      ),
    );
  }
}
