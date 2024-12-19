import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

import '../models/schedule.dart';
import '../services/database_service.dart';
import '../services/google_map_service.dart';

class HomeController extends GetxController {
  final DatabaseService service = Get.find<DatabaseService>();
  final GoogleMapService googleMapService = Get.find<GoogleMapService>();

  var selectedDate = Rx<DateTime?>(DateTime.now());
  var selectedTime = Rx<DateTime?>(DateTime.now());
  var selectedLocation = Rx<Position?>(null);

  void selectDate(DateTime date) async {
    selectedDate.value = date;
  }

  void selectTime(DateTime date) async {
    selectedTime.value = date;
  }

  void save() async {
    if (selectedDate.value == null) {
      Get.snackbar("通知", "尚未選擇日期", backgroundColor: Colors.white);
      return;
    }

    if (selectedTime.value == null) {
      Get.snackbar("通知", "尚未選擇時間", backgroundColor: Colors.white);
      return;
    }

    if (selectedLocation.value == null) {
      Get.snackbar("通知", "尚未選擇位置", backgroundColor: Colors.white);
      return;
    }

    Schedule schedule = Schedule(
      month: selectedDate.value!.month,
      day: selectedDate.value!.day,
      hour: selectedTime.value!.hour,
      minute: selectedTime.value!.minute,
      latitude: selectedLocation.value!.latitude,
      longitude: selectedLocation.value!.longitude,
    );

    try {
      await service.insert('schedule', 'Schedules', schedule.toMap());
      var savedSchedules = await service.query('schedule', 'Schedules');
      print(savedSchedules);
    } catch (e) {
      //"儲存失敗"
      Get.snackbar("警告", e.toString(), backgroundColor: Colors.white);
    }
  }

  Future<List<String>> queryAutocomplete(input) {
    return googleMapService.queryAutocomplete(input);
  }
}
