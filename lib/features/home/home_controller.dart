import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:time_to_go/models/schedule.dart';

import '../../services/database_service.dart';

class HomeController extends GetxController {
  final DatabaseService service = Get.find<DatabaseService>();

  var selectedTime = Rx<TimeOfDay?>(null);
  var selectedLocation = Rx<Position?>(null);

  void selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      selectedTime.value = pickedTime;
    }
  }

  void selectLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception("位置服務尚未啟用。");
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception("位置權限被拒絕。");
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception("位置權限被永久拒絕，無法獲取位置。");
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      );

      selectedLocation.value = position;
    } catch (e) {
      Get.snackbar("警告", "無法獲取位置", backgroundColor: Colors.red);
    }
  }

  void save() async {
    if (selectedTime.value == null) {
      Get.snackbar("通知", "尚未選擇時間", backgroundColor: Colors.green);
      return;
    }

    if (selectedLocation.value == null) {
      Get.snackbar("通知", "尚未選擇位置", backgroundColor: Colors.green);
      return;
    }

    Schedule schedule = Schedule(
      hour: selectedTime.value!.hour,
      minute: selectedTime.value!.minute,
      altitude: selectedLocation.value!.altitude,
      longitude: selectedLocation.value!.longitude,
    );

    try {
      await service.insert('schedule', 'Schedules', schedule.toMap());
      var savedSchedules = await service.query('schedule', 'Schedules');
      print(savedSchedules);
    } catch (e) {
      Get.snackbar("警告", "儲存失敗", backgroundColor: Colors.red);
    }
  }
}
