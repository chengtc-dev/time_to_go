import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_to_go/tabs/home_tab.dart';

import '../controllers/home_controller.dart';
import '../tabs/add_tab.dart';
import '../tabs/settings_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _mainTabController;
  final HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    _mainTabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _mainTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time To Go'),
      ),
      body: TabBarView(
        controller: _mainTabController,
        children: const [
          HomeTab(),
          AddTab(),
          SettingsTab(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: TabBar(
          controller: _mainTabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: '主頁'),
            Tab(icon: Icon(Icons.add), text: '新增'),
            Tab(icon: Icon(Icons.settings), text: '設定'),
          ],
        ),
      ),
    );
  }
}
