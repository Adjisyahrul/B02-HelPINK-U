import 'package:helpink_u/profil/api.dart';
import 'package:helpink_u/profil/data_diri.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:helpink_u/main.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({Key? key}) : super(key: key);

  @override
  _AddProfileState createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  ProfileAPI api = ProfileAPI();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final roleController = TextEditingController();
  final genderController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

  void onAdd() {
    final String valName = nameController.text;
    final String valEmail = emailController.text;
    final String valRole = roleController.text;
    final String valGender = genderController.text;
    final String valDob = dobController.text;
    final String valAddress = addressController.text;
    final String valPhone = phoneController.text;

    if (valName.isNotEmpty &&
        valEmail.isNotEmpty &&
        valRole.isNotEmpty &&
        valGender.isNotEmpty &&
        valDob.isNotEmpty &&
        valAddress.isNotEmpty &&
        valPhone.isNotEmpty) {
      final DataDiri dataDiri = DataDiri(
          name: valName,
          email: valEmail,
          address: valAddress,
          role: valRole,
          gender: valGender,
          phone: valPhone,
          birthday: valDob);
      Provider.of<ProfileAPI>(context, listen: false).createProfile(dataDiri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            const Text(
              "Edit Profil",
              style: TextStyle(color: myColor1, fontSize: 24),
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            TextFormField(
              controller: nameController,
            ),
            TextFormField(
              controller: emailController,
            ),
            TextFormField(
              controller: roleController,
            ),
            TextFormField(
              controller: dobController,
            ),
            TextFormField(
              controller: genderController,
            ),
            TextFormField(
              controller: phoneController,
            ),
            TextFormField(
              controller: addressController,
            ),
            const SizedBox(height: 20),
            RaisedButton(
                color: myColor1,
                child: Text('Submit'),
                onPressed: () {
                  onAdd();
                })
          ],
        ),
      ),
    );
  }
}
