import 'package:flutter/material.dart';
import 'package:time_to_go/widgets/location_search_widget.dart';
import '../widgets/date_picker_widget.dart';
import '../widgets/time_picker_widget.dart';

class AddTab extends StatelessWidget {
  const AddTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: const Column(
              children: [
                DatePickerWidget(),
                TimePickerWidget(),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          const LocationSearchWidget(),
        ],
      ),
    );
  }
}
