import 'package:flutter/material.dart';

class ProfessionsListingScreen extends StatefulWidget {
  const ProfessionsListingScreen({super.key});
  static const String name = 'professions_listing';
  static const String path = '/professions_listing';

  @override
  State<ProfessionsListingScreen> createState() =>
      _ProfessionsListingScreenState();
}

class _ProfessionsListingScreenState extends State<ProfessionsListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Container()));
  }
}
