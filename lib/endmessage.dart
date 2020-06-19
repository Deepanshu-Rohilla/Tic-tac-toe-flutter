import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final actionTest = "Reset";

  CustomDialog({this.title,this.content,this.callback,});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
            onPressed: callback,
            color: Colors.white,
            child: Text(actionTest))
      ],

    );
  }
}
