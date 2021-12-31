import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'edit_profil.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          ListTile('Logout', Icons.login, () async {
            final response = await request
                .logoutAccount("https://127.0.0.1:8000/login/logoutFlutter");
            if (response['status']) {
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PageLogin()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("An error occured, please try again."),
              ));
            }
          }),
        ],
      ),
    );
  }
}
