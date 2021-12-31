import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'api.dart';
import 'package:helpink_u/formulir_donasi/model.dart';
// import 'package:cool_alert/cool_alert.dart';
// import 'package:helpink_u/dana/model.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const appTitle = 'Formulir Donasi';

//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color(0xFFC37B89),
//           title: const Text(appTitle),
//         ),
//         body: const MyCustomForm(),
//       ),
//     );
//   }
// }

enum SingingCharacter { bni, mandiri, bca }

// Create a Form widget.
class FormDonasi extends StatefulWidget {
  const FormDonasi({Key? key}) : super(key: key);

  @override
  _FormDonasiState createState() => _FormDonasiState();
}

class _FormDonasiState extends State<FormDonasi> {
  Api api = Api();

  String? _bank;
  String? _norekening;
  int? _jmldonasi;

  final _formKey = GlobalKey<FormState>();
  SingingCharacter? _character = SingingCharacter.bni;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              decoration: const InputDecoration(
                hintText: 'Masukkan Bank Anda',
                labelText: 'Nama Bank',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
              },
              onSaved: (String? value) {
                _bank = value!;
              }),
          TextFormField(
              decoration: const InputDecoration(
                hintText: 'Masukkan nomor rekening',
                labelText: 'Nomor Rekening',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
              },
              onSaved: (String? value) {
                _norekening = value!;
              }),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Jumlah Donasi",
              hintText: 'Masukkan jumlah donasi yang ingin disumbangkan',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Only numbers can be entered
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              
            },
            onSaved: (String? value) {
                _jmldonasi = value! as int?;
              }
          ),
          ListTile(
            title: const Text('BNI (2837918948714)'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.bni,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Mandiri (32835928754)'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.mandiri,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('BCA (7123935919050)'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.bca,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  return;
                }
                _formKey.currentState!.save();
                onAdd();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Terima kasih sudah berdonasi di HelPINK U!'))
                );
                // CoolAlert.show(
                //   context: context,
                //   type: CoolAlertType.success,
                //   text: 'Terima kasih sudah berdonasi di HelPINK U!',
                //   confirmBtnColor: myColor1,
                //   backgroundColor: myColor1,
                // );
                print(_bank);
                print(_norekening);
                print(_jmldonasi);
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
  void onAdd() {
    final String bankFin = _bank!;
    final String norekeningFin = _norekening!;
    final int jmldonasiFin = _jmldonasi!;

    if (bankFin.isNotEmpty &&
        norekeningFin.isNotEmpty){
      final Model donasi = Model(
          bank: bankFin, norekening: norekeningFin, jmldonasi: jmldonasiFin);
      Provider.of<Api>(context, listen: false).tambahDonasi(donasi);
    }
  }
}
