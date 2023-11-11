// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class value_text_field extends StatelessWidget {
  const value_text_field({
    super.key,
    required TextEditingController valueController,
  }) : _valueController = valueController;

  final TextEditingController _valueController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(6),
          ],
          textAlign: TextAlign.center,
          controller: _valueController,
          style: TextStyle(
            color: Colors.white,
            fontSize: 34,
          ),
          decoration: InputDecoration(
              hintText: '0',
              hintStyle: TextStyle(color: Colors.white, fontSize: 34),
              border: InputBorder.none),
          validator: (val) {
            if (val!.isEmpty) {
              return 'Amount should be greater then 0';
            }
            return null;
          },
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
