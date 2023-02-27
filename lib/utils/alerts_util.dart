import 'package:flutter/material.dart';

showMessageDialog(
    {@required BuildContext context,
    @required String title,
    @required String message}) {
  AlertDialog(
    title: Text('$title'),
    content: Text('$message'),
    actions: [
      FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('OK'),
      ),
    ],
  );
}
