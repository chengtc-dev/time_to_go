import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        '這是設定頁',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
