import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return CalendarDatePicker(
      onDateChanged: (DateTime date) {
        controller.selectDate(date);
      },
      lastDate: DateTime.now().add(const Duration(days: 30)),
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
    );
  }
}
