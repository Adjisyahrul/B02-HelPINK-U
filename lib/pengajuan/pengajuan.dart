import 'package:flutter/material.dart';
import './apipengajuan.dart';
import 'package:provider/provider.dart';
import './model.dart';

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

  String? currentNama;
  String? currentLatar;
  String? currentLokasi;
  final _formKey = GlobalKey<FormState>();

  List<String> tipePengajuan = [' ', 'Dana', 'Tempat Isolasi', 'Bantuan Medis'];
  List<String> statusPengajuan = [' ', 'Diterima', 'Ditolak', 'Pending'];

  void onAdd() {
    final String namaFinal = currentNama!;
    final String tipeFinal = currentPengajuan;
    final String latarFinal = currentLatar!;
    final String lokasiFinal = currentLokasi!;
    final String statusFinal = currentStatus;

    if (namaFinal.isNotEmpty && tipeFinal.isNotEmpty && latarFinal.isNotEmpty && lokasiFinal.isNotEmpty && statusFinal.isNotEmpty) {
      final Model pengajuan = Model(
        nama: namaFinal, 
        tipePengajuan: tipeFinal, 
        latar: latarFinal, 
        lokasi: lokasiFinal, 
        status: statusFinal
        );
      Provider.of<PengajuanProvider>(context, listen: false).tambahPengajuan(pengajuan);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pengajuanP = Provider.of<PengajuanProvider>(context);
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
                          items: tipePengajuan.map<DropdownMenuItem<String>>((String tipePengajuanItem){
                            return DropdownMenuItem(
                              value: tipePengajuanItem,
                              child: Text(tipePengajuanItem),);
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
                          items: statusPengajuan.map<DropdownMenuItem<String>>((String status){
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
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Permintaan dibuat...')),
                                );
                                onAdd();
                                Navigator.pop(context);
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