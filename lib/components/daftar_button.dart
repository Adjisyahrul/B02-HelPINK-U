import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    @required this.text,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FlatButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 18),
        textColor: Colors.yellow[700],
        onPressed: onClicked,
      );
}
