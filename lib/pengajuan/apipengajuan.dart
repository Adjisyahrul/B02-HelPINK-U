import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class PengajuanProvider with ChangeNotifier{
  

  PengajuanProvider(){
    this.fetchPengajuan();
    
  }

  List<Model> _pengajuan=[];
  List<Model> get pengajuan{
    return[..._pengajuan];
  }

  void tambahPengajuan(Model pengajuan) async{
    final urlPengajuan = 'http://127.0.0.1:8000/pengajuan/json/';
    final response= await http.post(Uri.parse(urlPengajuan),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(pengajuan)
    );
    if(response.statusCode==201){
      _pengajuan.add(pengajuan);
      notifyListeners();
    }
  }
  
  fetchPengajuan() async{
    final urlPengajuan = 'http://127.0.0.1:8000/pengajuan/json/?format=json';
    final response = await http.get(Uri.parse(urlPengajuan));
    
    if(response.statusCode == 200){
      var data = json.decode(response.body) as List;
      _pengajuan= data.map<Model>((json) => Model.fromJson(json)).toList();
      notifyListeners();
    }
  }
}