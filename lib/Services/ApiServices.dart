import 'package:dio/dio.dart';
import 'package:weather_app/Model/WeatherModel.dart';

class WeatherServices {
  Dio dio;
  WeatherServices(this.dio) {}
  getWeather({required String CountryName}) async {
    String ApiKey = "259d9d06e1d94feebdb103403230512";
    String BaseUrl = "http://api.weatherapi.com/v1";
    Response response = await dio.get(
        "$BaseUrl/forecast.json?key=$ApiKey&q=$CountryName&days=1&aqi=no&alerts=no");
    Map jsonData = response.data;
    var json = jsonData["forecast"]["forecastday"][0]["day"];
    WeatherModel weatherModel = WeatherModel(
      name: jsonData["location"]["name"],
      country: jsonData["location"]["country"],
      image: jsonData["current"]["condition"]["icon"],
      status: jsonData["current"]["condition"]["text"],
      temp: jsonData["current"]["temp_c"],
      MaxTemp: json["maxtemp_c"],
      MinTemp: json["mintemp_c"],
      rain: jsonData["current"]["pressure_in"],
    );
    return weatherModel;
  }
}
