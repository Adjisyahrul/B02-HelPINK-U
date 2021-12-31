import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:helpink_u/main.dart';
import '../pengajuan/pengajuan.dart';

Future<List<Album>> fetchAlbum() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/apis/?format=json'));
  if (response.statusCode == 200) {
    return compute(parseAlbum, response.body);
  }
  else {
    throw Exception('Failed to load album');
  }
}

Future<List<Album>> deleteAlbum(String nama) async {
  final http.Response response = await http.delete(
    Uri.parse('http://10.0.2.2:8000/apis/?format=json/$nama'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 204) {
    return compute(parseAlbum, response.body);
  } else {
    throw Exception('Failed to delete album.');
  }
}

class Album {
  final String nama;
  final String tipePengajuan;
  final String latar;
  final String lokasi;
  final String status;

  Album({
     this.nama, 
     this.latar, 
     this.lokasi, 
     this.status, 
     this.tipePengajuan
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      nama: json['nama'],
      tipePengajuan: json['tipePengajuan'],
      latar: json['latar'],
      lokasi: json['lokasi'],
      status: json['status'],
    );
  }
}

List<Album> parseAlbum(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Album>((json) => Album.fromJson(json)).toList();
}

class Feed extends StatefulWidget {
  const Feed({Key key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
   Future<List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'helPINK U',
      theme: ThemeData(
        primaryColor: Color(0xFFC37B89),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('helPINK U'),
          backgroundColor: Color(0xFFC37B89),
        ),
        body: Column(
          children: <Widget>[
            FutureBuilder<List<Album>>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var list = <Widget>[];
                for(int i = 0; i < snapshot.data.length; i++) {
                  list.add(Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        
                        Text(
                              snapshot.data[i].nama,
                              style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600

                                ), 
                              ),
                        Container(
                          child: Row(
                            children: [
                              const SizedBox(height: 10),
                              Text(snapshot.data[i].lokasi + ' / ' + snapshot.data[i].latar + ' / ' + snapshot.data[i].status),
                              const SizedBox(width: 15),

                               GestureDetector(
                                onTap: () {},
                                
                                child: Container(
                                  child: 
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () {
                                      setState(() {
                                        futureAlbum = deleteAlbum(snapshot.data[i].nama.toString()) as Future<List<Album>>;
                                      });
                                    },
                                    
                                  ),
                                ),
                              ),        
                        Container(
                          child: Column(
                              ),
                            ),
                          ],),
                        ),
                      ],
                    ),
                    
                    padding:
                    const EdgeInsets.fromLTRB(15, 15, 0, 10),
                  ));
                }
                return Column(
                  children: list,
                  crossAxisAlignment: CrossAxisAlignment.start,
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          ], 
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFC37B89),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormPengajuan();
            }));
                        
          },

          child: Icon(Icons.add),
        ),
      ),
    );
  }
}