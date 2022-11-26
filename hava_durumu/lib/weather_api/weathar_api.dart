import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hava_durumu2/model/havadurumu_model.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<Weather>? getCurrentWeather(String city) async {
    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${WeatherApi - Apikey}=metric");

    var response = await http.get(url);

    var body = jsonDecode(response.body);

    return Weather.fromJson(body);
  }
}
