import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'package:provider/provider.dart';
import 'package:helpink_u/common/network_service.dart';
import 'edit_profile.dart';
import 'package:helpink_u/login/login.dart';
import 'package:helpink_u/main.dart';
import 'package:http/http.dart' as http;
import 'main_edit.dart';
import 'main_profil.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: myColor2,
            ),
            child: Text('HELPINK U'),
          ),
          ListTile(
            title: const Text('Lihat Profil'),
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfilProvide();
              }));
            },
          ),
          ListTile(
            title: const Text('Edit Profil'),
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditProvide();
              }));
            },
          ),
          request.loggedIn
              ? ListTile(
                  title: const Text('Log Out'),
                  onTap: () async {
                    final response = await request.logoutAccount(
                        "https://127.0.0.1:8000/login/logoutFlutter");
                    if (response['status']) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Successfully logged out!"),
                      ));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => LoginPage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("An error occured, please try again."),
                      ));
                    }
                  },
                )
              : buildMenuItem(
                  text: 'Daftar',
                  onClicked: () => Navigator.pushNamed(context, "/welcome")),
        ],
      ),
    );
  }

  Widget buildMenuItem({
    String text,
    VoidCallback onClicked,
  }) {
    return ListTile(
      title: Text(text),
    );
  }
}
