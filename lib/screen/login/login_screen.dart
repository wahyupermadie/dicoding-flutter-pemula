import 'dart:async';

import 'package:dicoding_final_project1/screen/otp/otp_screen.dart';
import 'package:dicoding_final_project1/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final myController = TextEditingController();
  Timer? _debounce;
  bool? _isPhoneNumberValid;

  changesOnField() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      String text = myController.text;
      _isPhoneNumberValid = text.isPhoneNumberValid;
      setState(() {});
    });
  }

  @override
  void initState() {
    myController.addListener(changesOnField);
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 18,
              right: 18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Masukan nomor telepon yang kamu gunakan ketika mendaftar akun kamu",
                  style: TextStyle(
                    color: ProjectColors.secondaryTextColor,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: myController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "No Telepon",
                    hintStyle:
                        TextStyle(color: ProjectColors.secondaryTextColor),
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                Spacer(),
                if(_isPhoneNumberValid == true)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ProjectColors.orangePrimary,
                      minimumSize: Size(screenSize.width, 44.0),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => new OtpScreen())
                      );
                    },
                    child: Text("Login"),
                  )
                 else
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      minimumSize: Size(screenSize.width, 44.0),
                    ),
                    onPressed: null,
                    child: Text("Login"),
                  ),
                SizedBox(
                  height: 36,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
