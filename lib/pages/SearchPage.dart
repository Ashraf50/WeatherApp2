import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Services/ApiServices.dart';

import '../Model/WeatherModel.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  VoidCallback? updateUi;
    SearchPage({this.updateUi});
final SearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Search",
          style: TextStyle(fontSize: 25),
        ),
        elevation: 0,
        backgroundColor: const Color(0xff3281FA),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: SearchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "Search a country",
                  labelText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
            ElevatedButton(
              onPressed: () async {
                WeatherData = await WeatherServices(Dio())
                    .getWeather(CountryName: SearchController.text);
                // ignore: use_build_context_synchronously
                updateUi!();
                
                Navigator.pop(context);
              },
              child: const Text(
                "Search",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

WeatherModel? WeatherData;
