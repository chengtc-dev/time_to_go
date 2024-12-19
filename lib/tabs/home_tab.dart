import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        '這是主頁',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
