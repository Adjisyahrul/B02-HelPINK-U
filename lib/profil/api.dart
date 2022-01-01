import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data_diri.dart';

class ProfileAPI with ChangeNotifier {
  ProfileAPI() {
    this.fetchProfil();
  }

  List<DataDiri> _profil = [];
  List<DataDiri> get profil {
    return [..._profil];
  }

  void createProfile(DataDiri profil) async {
    final url = 'http://127.0.0.1:8000/profil/jsonprofil/';

    final response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(profil));

    if (response.statusCode == 201) {
      _profil.add(profil);
      notifyListeners();
    }
  }

  fetchProfil() async {
    final url = 'http://127.0.0.1:8000/profil/jsonprofil/?format=json';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _profil = data.map<DataDiri>((json) => DataDiri.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
