import 'package:baby_care/baby_care_app.dart';
import 'package:baby_care/core/helper/hive_helper.dart';
import 'package:baby_care/core/services/get_it_service.dart';
import 'package:baby_care/core/services/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await NotificationService.init();
  setupServiceLocator();

  await HiveHelper.init();

  HiveHelper.registerAdapter();

  runApp(const BabyCareApp());
}
