import 'package:get/get.dart';

import '../../services/database_service.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DatabaseService>(() => DatabaseService());
  }
}
