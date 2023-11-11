import 'package:flutter/material.dart';

const TextField_decor = InputDecoration(
  filled: true,
  fillColor: Color.fromRGBO(255, 202, 233, 100),
);

const loader = Center(
  child: CircularProgressIndicator(),
);

extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}
