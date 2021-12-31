import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class Repo with ChangeNotifier{
  

  Repo(){
    this.fetchSaran();
    
  }

  List<Model> _saran=[];
  List<Model> get saran{
    return[..._saran];
  }

  void tambahSaran(Model saran) async{
    final urlSaran = 'http://127.0.0.1:8000/saran/json/';

    final response= await http.post(Uri.parse(urlSaran),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(saran)
    );

    if(response.statusCode==201){
      ///saran.id = json.decode(response.body)['id'];
      _saran.add(saran);
      notifyListeners();
    }
    
  }
  
  fetchSaran() async{
    final urlSaran = 'http://127.0.0.1:8000/saran/json/?format=json';
    final response = await http.get(Uri.parse(urlSaran));
    
    if(response.statusCode == 200){
      var data = json.decode(response.body) as List;
      _saran= data.map<Model>((json) => Model.fromJson(json)).toList();
      notifyListeners();
      //print("keambil guys");
    }
  }

  


}
