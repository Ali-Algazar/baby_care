import 'package:baby_care/baby_care_app.dart';
import 'package:baby_care/core/helper/hive_helper.dart';
import 'package:baby_care/core/services/get_it_service.dart';
import 'package:baby_care/core/services/notification_service.dart'; // تأكد من المسار
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  setupServiceLocator();
  await HiveHelper.init();
  HiveHelper.registerAdapter();

  await NotificationService.init();
  FirebaseMessaging.instance.getToken().then((token) {
    print("📢 My Device Token: $token");
  });

  runApp(const BabyCareApp());
}
