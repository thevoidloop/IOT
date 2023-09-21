import 'dart:convert';
import 'package:http/http.dart' as http;

class SensorData {
  static Future<double> getAverageTemperature() async {
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
}
