//import 'dart:html';

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


















// final _baseURL = 'http://10.0.2.2:8000/saran/saran_json/';

  // Future kirimData(String role, String keluhan, String pesan, String rating) async{
  //   try {
  //     var resp = await http.post(Uri.parse(_baseURL),
  //       headers: <String,String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode(<String,String>{
  //         "role": role, "keluhan":keluhan, "pesan": pesan, "rating":rating
  //       })
  //     );
      
  //     if (resp.statusCode==202) {
  //       return Model.fromJson(jsonDecode(resp.body));
  //     } else {
  //       print("jengjeng");
  //       //throw Exception('Failed to create model.');
  //     }
  //   } 
  //   catch (e) {
  //     //print(e.toString());
  //   }
  // }