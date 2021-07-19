import 'package:dicoding_final_project1/data/vaksin_place.dart';
import 'package:dicoding_final_project1/utils/data_generator.dart';
import 'package:dicoding_final_project1/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<VaksinPlace> _vaksinPlaces = getVaksinPlaces();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Lokasi Vaksinasi",
            style: TextStyle(color: Colors.black),
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
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(8),
                itemCount: _vaksinPlaces.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            _vaksinPlaces[index].locationName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(_vaksinPlaces[index].locationAddress),
                          Text(_vaksinPlaces[index].lastUpdate),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
