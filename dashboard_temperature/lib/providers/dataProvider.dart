// ignore_for_file: file_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/data.dart';

final getTemperatureProvider = StreamProvider<String>((ref) {
  return Stream.periodic(
    const Duration(seconds: 3),
    (_) async {
      final averageTemperature = await SensorData.getAverageTemperature();
      return averageTemperature.toString();
    },
  ).asyncMap((event) async => await event);
});

final getLamp1PowerProvider = StreamProvider<int>((ref) {
  return Stream.periodic(
    const Duration(seconds: 3),
    (_) async {
      final lamp1PowerValue = await SensorData.getLamp1PowerValue();
      return lamp1PowerValue;
    },
  ).asyncMap((event) async => await event);
});
