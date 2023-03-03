import 'package:flutter/material.dart';

class DialogUtils {
  static Future<bool?> displayDialogOKCallBack(BuildContext context,
      String title, String message, Function()? callback) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: callback,
              child: const Text("ok"),
            ),
          ],
        );
      },
    );
  }
}
