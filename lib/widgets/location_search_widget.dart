import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_to_go/controllers/home_controller.dart';

class LocationSearchWidget extends StatefulWidget {
  const LocationSearchWidget({super.key});

  @override
  State<LocationSearchWidget> createState() => _LocationSearchWidgetState();
}

class _LocationSearchWidgetState extends State<LocationSearchWidget> {
  HomeController controller = Get.find<HomeController>();
  List<String> predictions = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CupertinoSearchTextField(
            onChanged: (String input) async {
              var results = await controller.queryAutocomplete(input);

              setState(() {
                predictions = results;
              });
            },
            onSubmitted: (String value) {},
          ),
        ),
        SizedBox(
          height: 200,
          child: SingleChildScrollView(
            child: Column(
              children: predictions.map(
                (prediction) {
                  return ListTile(
                    title: Text(prediction),
                    onTap: () {
                      // 點擊建議結果後的處理邏輯
                    },
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
