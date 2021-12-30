import 'package:flutter/material.dart';

class cekAkun extends StatelessWidget {
  final bool question;
  final Function press;
  const cekAkun({
    Key key,
    this.question = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          question ? "Don’t have an Account ? " : "Sudah punya akun? ",
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            question ? "Daftar" : "Masuk",
            style: TextStyle(
              color: Colors.yellow[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
