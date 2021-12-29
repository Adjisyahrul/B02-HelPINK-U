import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  String currentStatus = ' ';
  String currentPengajuan = ' ';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          

          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Mohon isi dengan nama Anda';
              }
              return null;
            },
            decoration: const InputDecoration(
                  hintText: 'Nama Lengkap',
                  labelText: 'Nama',
            ),
          ),

          DropdownButtonFormField(
            value: currentPengajuan,
            items: <String>[' ', 'Isolasi', 'Permohonan Dana'].map<DropdownMenuItem<String>>((String tipePengajuan){
              return DropdownMenuItem(
                value: tipePengajuan,
                child: Text(tipePengajuan),);
            }).toList(),
            onChanged: (String? newPengajuan){
              setState((){
                currentPengajuan = newPengajuan!;
              });
            },
            decoration: const InputDecoration(
                  labelText: 'Tipe Pengajuan',
            ),
          ),

          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Mohon isi alasan Anda';
              }
              return null;
            },
            decoration: const InputDecoration(
                  hintText: 'Alasan Mengapa Melakukan Pengajuan',
                  labelText: 'Latar',
            ),
          ),
          
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Mohon isi dengan alamat tempat tinggal Anda';
              }
              return null;
            },
            decoration: const InputDecoration(
                  hintText: 'Lokasi Tempat Tinggal',
                  labelText: 'Lokasi',
            ),
          ),

          DropdownButtonFormField(
            value: currentStatus,
            items: <String>[' ', 'Pending', 'Accepted'].map<DropdownMenuItem<String>>((String status){
              return DropdownMenuItem(
                value: status,
                child: Text(status),);
            }).toList(),
            onChanged: (String? newStatus){
              setState((){
                currentStatus = newStatus!;
              });
            },
            decoration: const InputDecoration(
                  labelText: 'Status',
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}