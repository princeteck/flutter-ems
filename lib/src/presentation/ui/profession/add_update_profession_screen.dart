import 'package:ems/src/data/models/profession/profession_model.dart';
import 'package:flutter/material.dart';

class AddUpdateProfessionScreen extends StatefulWidget {
  const AddUpdateProfessionScreen({super.key, this.profession});
  static const String name = 'add_update_profession';
  static const String path = '/add_update_profession';
  final ProfessionModel? profession;

  @override
  State<AddUpdateProfessionScreen> createState() =>
      _AddUpdateProfessionScreenState();
}

class _AddUpdateProfessionScreenState extends State<AddUpdateProfessionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Container()));
  }
}
