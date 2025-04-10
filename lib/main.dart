import 'package:ems/src/app.dart';
import 'package:ems/src/core/di/di.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const EmsApp());
}
