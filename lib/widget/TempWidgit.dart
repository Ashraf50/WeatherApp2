import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import '../pages/SearchPage.dart';
import 'card.dart';

class TempWidget extends StatefulWidget {
  const TempWidget({super.key});

  @override
  State<TempWidget> createState() => _TempWidgetState();
}

class _TempWidgetState extends State<TempWidget> {
  @override
  Widget build(BuildContext context) {
    // Function Extract on word to many words
    String extractFirstWord(String text) {
      List<String> words = text.split(' ');
      List<String> firstWords = [];
      for (int i = 0; i < words.length; i += 2) {
        firstWords.add(words[i]);
      }
      String result = firstWords.join(' ');
      return result;
    }

    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    Text(
                      extractFirstWord(
                        WeatherData!.name,
                      ),
                      style: const TextStyle(
                        fontSize: 33,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  WeatherData!.country,
                  style: const TextStyle(
                    fontSize: 33,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: Color.fromARGB(37, 45, 45, 45),
                    color: Color.fromARGB(74, 124, 171, 232)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.network("https:${WeatherData!.image}",
                            height: 100),
                        Text("${WeatherData!.status}",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    Text(
                      "${WeatherData!.temp}",
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardWidget(
                      text1: "AVERAGE MIN",
                      text2: "TEMPERATURE",
                      text3: "${WeatherData!.MinTemp}",
                      icon: const Icon(
                        Ionicons.md_thermometer,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                    CardWidget(
                      text1: "AVERAGE MAX",
                      text2: "TEMPERATURE",
                      text3: "${WeatherData!.MaxTemp}",
                      icon: const Icon(
                        Ionicons.md_thermometer,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardWidget(
                      text1: "AVERAGE SOLAR",
                      text2: "RADIATION",
                      text3: "${WeatherData!.rain}",
                      icon: const Icon(
                        Icons.sunny,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                    CardWidget(
                      text1: "TOTAL WEEKLY",
                      text2: "RAINFALL",
                      text3: "0",
                      icon: const Icon(
                        Ionicons.md_umbrella,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
