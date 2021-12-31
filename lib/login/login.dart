import 'package:flutter/material.dart';
import 'package:helpink_u/common/network_service.dart';
import 'package:provider/provider.dart';
import 'package:helpink_u/home/home_admin.dart';
import 'package:helpink_u/home/home_donatur.dart';
import 'package:helpink_u/home/home_pengaju.dart';
import 'package:helpink_u/Screens/Signup/tampilan_daftar.dart';

// void main() {
//   runApp(MaterialApp(
//     title: "Login",
//     home: LoginPage(),
//   ));
// }

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
  static const ROUTE_NAME = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String username = "";
  String password = "";
  String message = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xFFC37B89),
        title: Text(
          'HelPINK U',
          style: TextStyle(
            color: Colors.white,
          ), // style
        ), // title
      ), //appbar
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
            ), // box
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 400,
                  width: 350,
                  decoration: BoxDecoration(
                      color: new Color(0xFFC37B89),
                      borderRadius: BorderRadius.circular(15)), // deco
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Masuk',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ), // style
                      ), // Text
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: new InputDecoration(
                            hintText: "Username...",
                            labelText: "Username",
                            suffixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0)),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              username = value;
                            });
                          },
                          onSaved: (String value) {
                            setState(() {
                              username = value;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String value) {
                            if (value != null && value.isEmpty) {
                              return 'Username tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: true,
                          decoration: new InputDecoration(
                            hintText: "Password...",
                            labelText: "Password",
                            suffixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0)),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              password = value;
                            });
                          },
                          onSaved: (String value) {
                            setState(() {
                              password = value;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String value) {
                            if (value != null && value.isEmpty) {
                              return 'Password tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 250,
                        child: RaisedButton(
                          child: Text(
                            "Masuk",
                            style: TextStyle(color: Colors.orange),
                          ),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          onPressed: () async {
                            final response = await request.login(
                                "http://127.0.0.1:8000/login/loginFlutter", {
                              'username': username,
                              'password': password,
                            });
                            message = response['message'];
                            if (response['status']) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Successfully logged in!"),
                              ));

                              if (request.group == "pemberi") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePageDon()));
                              } else if (request.group == "penerima") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePagePeng()));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePagePeng()));
                              }
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(message),
                              ));
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Text(
                        'Belum punya akun?',
                        style: TextStyle(
                          color: Colors.white,
                        ), //style
                      ), // text
                      TextButton(
                        //ganti button aja
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen())),
                        child: Container(
                          child: const Text(
                            'Daftar',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Colors.orange,
                            ), // style
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
