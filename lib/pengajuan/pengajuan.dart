import 'package:flutter/material.dart';

class FormPengajuan extends StatefulWidget {
  const FormPengajuan({Key? key}) : super(key: key);

  @override
  FormPengajuanState createState() {
    return FormPengajuanState();
  }
}

class FormPengajuanState extends State<FormPengajuan> {
  String currentStatus = ' ';
  String currentPengajuan = ' ';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
          color: Color.fromRGBO(214, 156, 168, 1),
          child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Color.fromRGBO(214, 156, 168, 1),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  
                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    'Data Pengaju',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,)
                    ),
                  
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(const Radius.circular(8)),
                    ),
                    constraints: BoxConstraints.tightForFinite(
                      width: 500,
                    ),
                    child: Column(
                      children: <Widget> [
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
                          items: <String>[' ', 'Dana', 'Tempat Isolasi', 'Bantuan Medis'].map<DropdownMenuItem<String>>((String tipePengajuan){
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
                          items: <String>[' ', 'Diterima', 'Ditolak', 'Pending'].map<DropdownMenuItem<String>>((String status){
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
                  ),

                  SizedBox(
                    height: 20,
                  ),

              ],)
            ),
          ],
        ),
      )
    );
  }
}