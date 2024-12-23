import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  runApp(const App());
}
