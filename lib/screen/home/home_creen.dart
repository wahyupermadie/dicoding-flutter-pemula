
import 'package:dicoding_final_project1/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
              "Home",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Ini adalah tampilan home nya",
              style: TextStyle(
                color: ProjectColors.secondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    ),
    ),
    );
  }
}
