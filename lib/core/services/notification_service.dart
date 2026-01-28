import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// ⚠️ دالة الخلفية لازم تكون Top-Level (بره الكلاس)
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // ممكن تضيف لوجيك هنا لو محتاج
}

class NotificationService {
  // كائن Local Notifications
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // تعريف القناة للأندرويد
  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  /// دالة التهيئة (بتجمع كل حاجة)
  static Future<void> init() async {
    final messaging = FirebaseMessaging.instance;

    // 1. طلب الإذن (كودك القديم)
    await messaging.requestPermission(alert: true, badge: true, sound: true);

    // 2. إعدادات Local Notifications
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    // 3. تهيئة البلاجن (مع التصحيح الجديد settings:)
    await _localNotificationsPlugin.initialize(
      settings: initializationSettings, // ✅ هنا التعديل المهم
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print("User tapped on notification: ${response.payload}");
      },
    );

    // 4. إنشاء القناة
    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_channel);

    // 5. تفعيل معالج الخلفية
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // 6. الاستماع للإشعارات في الـ Foreground
    FirebaseMessaging.onMessage.listen(_showNotification);
  }

  /// دالة خاصة لعرض الإشعار (Helper Method)
  static void _showNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      _localNotificationsPlugin.show(
        id: notification.hashCode,
        title: notification.title,
        body: notification.body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            _channel.id,
            _channel.name,
            channelDescription: _channel.description,
            icon: android.smallIcon, // بيأخد أيقونة الإشعار الجاي من FCM
            priority: Priority.high,
            importance: Importance.max,
          ),
        ),
      );
    }
  }
}
