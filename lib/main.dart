import 'package:baby_care/baby_care_app.dart';
import 'package:baby_care/core/services/get_it_service.dart';
import 'package:flutter/material.dart';

void main() async {
  setupServiceLocator();
  runApp(const BabyCareApp());
}
