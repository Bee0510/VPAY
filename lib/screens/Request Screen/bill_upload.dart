import 'package:flutter/material.dart';

import 'request_screen.dart';

class bill_upload extends StatelessWidget {
  const bill_upload({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buttons(
                width: 80,
                height: 40,
                text: 'Uplaod Bill',
                fontsize: 12,
                onPressed: () {}),
            SizedBox(height: 10),
            buttons(
                width: 80,
                height: 40,
                text: 'Capture Bill',
                fontsize: 12,
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
