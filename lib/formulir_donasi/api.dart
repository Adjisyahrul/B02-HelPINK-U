import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class Api with ChangeNotifier{
  

  Api(){
    this.fetchDonasi();
    
  }

  List<Model> _donasi=[];
  List<Model> get donasi{
    return[..._donasi];
  }

  void tambahDonasi(Model dana) async{
    final urlDonasi = 'http://127.0.0.1:8000/dana/json/';

    final response= await http.post(Uri.parse(urlDonasi),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(dana)
    );

    if(response.statusCode==201){
      ///dana.id = json.decode(response.body)['id'];
      _donasi.add(dana);
      notifyListeners();
    }
    
  }
  
  fetchDonasi() async{
    final urlDonasi = 'http://127.0.0.1:8000/dana/json/?format=json';
    final response = await http.get(Uri.parse(urlDonasi));
    
    if(response.statusCode == 200){
      var data = json.decode(response.body) as List;
      _donasi= data.map<Model>((json) => Model.fromJson(json)).toList();
      notifyListeners();
      //print("keambil guys");
    }
  }

  


}
