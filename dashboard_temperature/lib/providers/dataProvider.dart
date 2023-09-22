// ignore_for_file: file_names

import 'package:dashboard_temperature/model/lampModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/data.dart';

final getTemperatureProvider = StreamProvider<String>(
  (ref) {
    return Stream.periodic(
      const Duration(seconds: 1),
      (_) async {
        final averageTemperature = await SensorData.getAverageTemperature();
        return averageTemperature;
      },
    ).asyncMap((event) async => await event);
  },
);

final getLamp1PowerProvider = StreamProvider<int>(
  (ref) {
    return Stream.periodic(
      const Duration(seconds: 1),
      (_) async {
        final lamp1PowerValue = await SensorData.getLamp1PowerValue();
        return lamp1PowerValue;
      },
    ).asyncMap((event) async => await event);
  },
);

final getLamp2PowerProvider = StreamProvider<int>(
  (ref) {
    return Stream.periodic(
      const Duration(seconds: 1),
      (_) async {
        final lamp2PowerValue = await SensorData.getLamp2PowerValue();
        return lamp2PowerValue;
      },
    ).asyncMap((event) async => await event);
  },
);

final lampItemsProvider = StreamProvider.autoDispose<List<LampItem>>(
  (ref) {
    return Stream.periodic(
      const Duration(seconds: 3),
      (_) async {
        final lampItems = await SensorData.getLamp1Data();
        return lampItems;
      },
    ).asyncMap((event) async => await event);
  },
);

final homeProvider = StateProvider<bool>((ref) {
  return true;
});
