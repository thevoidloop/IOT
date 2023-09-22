import 'dart:convert';
import 'package:dashboard_temperature/model/lampModel.dart';
import 'package:http/http.dart' as http;

class SensorData {
  static Future<String> getAverageTemperature() async {
    final response = await http.get(Uri.parse('http://localhost:3000/getAverageTemperature'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['averageTemperature'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<int> getLamp1PowerValue() async {
    final response = await http.get(Uri.parse('http://localhost:3000/getLamp1PowerValue'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['power'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<int> getLamp2PowerValue() async {
    final response = await http.get(Uri.parse('http://localhost:3000/getLamp2PowerValue'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['power'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<LampItem>> getLamp1Data() async {
    final response = await http.get(Uri.parse('http://localhost:3000/getLamp1History'));
    List<LampItem> history = [];
    DateTime tempDate = DateTime(2023);
    bool isNew = true;
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      data.forEach((item) {
        if ((item['power'] == 0) && isNew) {
          LampItem temp = LampItem(power: 0, inicio: DateTime.parse(item['inicio']), lampItemFinal: DateTime.parse(item['final']));
          history.add(temp);
        } else if ((item['power'] == 1) && isNew) {
          tempDate = DateTime.parse(item['inicio']);
          isNew = false;
        } else if ((item['power'] == 0) && !isNew) {
          LampItem temp = LampItem(power: 0, inicio: tempDate, lampItemFinal: DateTime.parse(item['final']));
          history.add(temp);
          print(temp.inicio);
          print(temp.lampItemFinal);
          print(temp.power);
          isNew = true;
        }
      });
      return history;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
