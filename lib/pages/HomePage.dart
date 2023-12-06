import 'package:flutter/material.dart';
import 'package:weather_app/pages/SearchPage.dart';
import 'package:weather_app/widget/TempWidgit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff58A4FC),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Weather",
            style: TextStyle(fontSize: 25),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchPage(updateUi:updateUi ),
                        ));
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 40,
                  )),
            )
          ],
          elevation: 0,
          backgroundColor: const Color(0xff3281FA),
        ),
        body: WeatherData == null
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'There is no weather😔',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white
                      ),
                    ),
                    Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white
                      ),
                    ),
                    Text(
                      'Searching now 🔍',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
              )
            : const Column(
                children: [
                  TempWidget(),
                  // CardGridView(),
                ],
              ));
  }
}
