import 'package:flutter/material.dart';

class form_field extends StatelessWidget {
  const form_field({
    super.key,
    required TextEditingController noteController,
    required this.hint,
  }) : _noteController = noteController;

  final TextEditingController _noteController;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[800],
        ),
        child: TextFormField(
          textAlign: TextAlign.center,
          controller: _noteController,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
