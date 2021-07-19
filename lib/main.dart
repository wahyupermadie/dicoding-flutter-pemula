import 'package:dicoding_final_project1/screen/login/login_screen.dart';
import 'package:dicoding_final_project1/screen/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthPage(),
    );
  }
}

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenSize.width / 2,
                  height: screenSize.width / 2,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: SvgPicture.asset('assets/ic_doctor.svg'),
                ),
              ],
            ),
            SizedBox(
              height: 42,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: ProjectColors.orangePrimary,
                minimumSize: Size((screenSize.width / 1.3).toDouble(), 44.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => new RegisterScreen()),
                );
              },
              child: Text("Register"),
            ),
            SizedBox(
              height: 12,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: ProjectColors.orangePrimary, width: 1),
                primary: ProjectColors.orangePrimary,
                minimumSize: Size((screenSize.width / 1.3).toDouble(), 44.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => new LoginScreen()),
                );
              },
              child: Text("Login"),
            ),
            Spacer(),
            Row(
              children: [
                SizedBox(
                  width: 45,
                ),
                Expanded(
                  child: Divider(color: Colors.black),
                ),
                SizedBox(
                  width: 15,
                ),
                Text("OR"),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Divider(color: Colors.black),
                ),
                SizedBox(
                  width: 46,
                ),
              ],
            ),
            ElevatedButton.icon(
              icon: Icon(
                Icons.facebook,
                size: 24,
              ),
              label: Text("Connect to Facebook"),
              style: ElevatedButton.styleFrom(
                primary: ProjectColors.facebookColor,
                minimumSize: Size((screenSize.width / 1.3).toDouble(), 44.0),
              ),
              onPressed: () {},
            ),
            SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
