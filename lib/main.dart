import 'package:ems/src/app.dart';
import 'package:flutter/material.dart';
import 'src/core/di/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupDependencies();
  runApp(const EmsApp());
}
