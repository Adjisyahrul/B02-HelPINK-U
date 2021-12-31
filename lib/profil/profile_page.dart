import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api.dart';
import 'package:helpink_u/main.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profil = Provider.of<ProfileAPI>(context);

    return Container(
      margin: const EdgeInsets.all(14),
      child: Column(
        children: <Widget>[
          const Text(
            "Profil Pengguna",
            style: TextStyle(color: myColor1, fontSize: 30),
          ),
          const Padding(padding: EdgeInsets.only(top: 20.0)),
          Flexible(
              fit: FlexFit.tight,
              child: ListView.builder(
                  itemCount: profil.profil.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(profil.profil[index].name,
                            style:
                                const TextStyle(fontSize: 20, color: myColor1)),
                        subtitle: Text(
                            "\nRole : " +
                                profil.profil[index].role +
                                "\n" +
                                "TTL   : " +
                                profil.profil[index].birthday +
                                "\n" +
                                "Email  : " +
                                profil.profil[index].email +
                                "\n" +
                                "Gender  : " +
                                profil.profil[index].gender +
                                "\n" +
                                "No.Telp   : " +
                                profil.profil[index].phone +
                                "\n" +
                                "TTL   : " +
                                profil.profil[index].birthday +
                                "\n" +
                                "Alamat   : " +
                                profil.profil[index].address +
                                "\n",
                            style: const TextStyle(fontSize: 12)),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
