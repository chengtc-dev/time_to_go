import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('首頁')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                controller.selectedTime.value != null
                    ? '選擇時間: ${controller.selectedTime.value!.format(context)}'
                    : '尚未選擇時間',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.selectTime,
              child: const Text('選擇時間'),
            ),
            const SizedBox(height: 20),
            Obx(
              () => Text(
                controller.selectedLocation.value != null
                    ? '位置: Lat: ${controller.selectedLocation.value!.latitude}, '
                        'Lng: ${controller.selectedLocation.value!.longitude}'
                    : '尚未選擇位置',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.selectLocation,
              child: const Text('選擇地點'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.save,
              child: const Text('儲存'),
            ),
          ],
        ),
      ),
    );
  }
}
