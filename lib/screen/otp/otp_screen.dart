
import 'package:dicoding_final_project1/screen/home/home_creen.dart';
import 'package:dicoding_final_project1/utils/utils.dart';
import 'package:dicoding_final_project1/widget/otp_view.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<OtpScreen> {
  MaterialColor _btnColorState = Colors.grey;
  VoidCallback? _actionState;

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
                  "Kode Verifikasi",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Masukan kode verifikasi yang telah dikirimkan ke nomor 082123123123",
                  style: TextStyle(
                    color: ProjectColors.secondaryTextColor,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                OtpWidget(
                  onCompleted: (value) {
                    print(value);
                    if (value.isEmpty) {
                      _btnColorState = Colors.grey;
                      _actionState = null;
                    } else {
                      _btnColorState = Colors.blue;
                      _actionState = () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (builder) => new HomeScreen(),
                        ));
                      };
                    }
                  },
                ),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: _btnColorState,
                    minimumSize: Size(screenSize.width, 44.0),
                  ),
                  onPressed: _actionState,
                  child: Text("Verifikasi"),
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
