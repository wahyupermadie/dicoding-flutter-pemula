import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dicoding_final_project1/utils/utils.dart';

void main() => runApp(RegisterApp());

class RegisterApp extends StatefulWidget {
  const RegisterApp();

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterApp> {
  final phoneNumberController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? errorMessageName;
  String? errorMessagePhone;
  String? errorMessageEmail;

  onUserNameChanged() {
    Timer? _debounce;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () {
      String text = nameController.text;
      if (text.isEmpty) {
        errorMessageName = "Please input your name";
      } else if (text.length < 3) {
        errorMessageName = "Please input valid name";
      } else {
        errorMessageName = null;
      }
      setState(() {
        _debounce?.cancel();
      });
    });
  }

  onEmailChanged() {
    Timer? _debounce;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () {
      String text = emailController.text;
      print(text);
      print(text.isEmailValid);
      if (text.isEmailValid) {
        errorMessageEmail = null;
      } else {
        errorMessageEmail = "Please enter valid email address";
      }
      setState(() {
        _debounce?.cancel();
      });
    });
  }

  onPhoneNumberChanged() {
    Timer? _debounce;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () {
      String text = phoneNumberController.text;
      if (text.isPhoneNumberValid) {
        errorMessagePhone = null;
      } else {
        errorMessagePhone = "Please enter valid phone number";
      }
      setState(() {
        _debounce?.cancel();
      });
    });
  }

  @override
  void initState() {
    phoneNumberController.addListener(onPhoneNumberChanged);
    nameController.addListener(onUserNameChanged);
    emailController.addListener(onEmailChanged);
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      home: GestureDetector(
        onTap: () => {
          FocusManager.instance.primaryFocus?.unfocus()
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height:
                          screenSize.height,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Register",
                              style: TextStyle(fontSize: 24),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Lengkapi data diri kamu, dan pastikan data yang kamu isi telah sesuai.",
                              style: TextStyle(
                                color: ProjectColors.secondaryTextColor,
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            TextFormField(
                              controller: nameController,
                              validator: (value) {
                                return errorMessageName;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[a-zA-Z]"))
                              ],
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Nama",
                                  hintStyle: TextStyle(
                                      color: ProjectColors.secondaryTextColor),
                                  prefixIcon: Icon(Icons.account_circle),
                                  errorText: errorMessageName),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              validator: (value) {
                                return errorMessagePhone;
                              },
                              controller: phoneNumberController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                              ],
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "No Telepon",
                                  hintStyle: TextStyle(
                                      color: ProjectColors.secondaryTextColor),
                                  prefixIcon: Icon(Icons.phone),
                                  errorText: errorMessagePhone),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              validator: (value) {
                                return errorMessageEmail;
                              },
                              controller: emailController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Alamat Email",
                                  hintStyle: TextStyle(
                                      color: ProjectColors.secondaryTextColor),
                                  prefixIcon: Icon(Icons.email),
                                  errorText: errorMessageEmail),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        if (_formKey.currentState?.validate() == true)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: ProjectColors.orangePrimary,
                              minimumSize: Size(screenSize.width, 44.0),
                            ),
                            onPressed: () {},
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
                          height: 16,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
