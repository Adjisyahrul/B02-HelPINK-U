import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'package:provider/provider.dart';
import 'package:helpink_u/common/network_service.dart';
import 'edit_profile.dart';
import 'package:helpink_u/login/login.dart';
import 'package:helpink_u/main.dart';
import 'package:http/http.dart' as http;


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
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Lihat Profil'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserProfile()));
            },
          ),
          ListTile(
            title: const Text('Tambah Profil'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddProfile()));
            },
          ),
          const SizedBox(height: 16),
            request.loggedIn
                ? ListTile(
                    title: const Text('Log Out'),
                    onTap: () async {
                      final response = await request.logoutAccount(
                          "https://127.0.0.1:8000/login/logoutFlutter");
                      if (response['status']) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Successfully logged out!"),
                        ));
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => LoginPage(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("An error occured, please try again."),
                        ));
                      }
                    },
                  )

        ],
      ),
    );
  }
}
