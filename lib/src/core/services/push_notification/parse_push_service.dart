import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../utility/logger/logger.dart';
import '../constant/firebase_options.dart';
import 'local_notifications_service.dart';

//To handle messages while application is in the foreground
//Must be top level function
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  Logger.i('Handling a background message ${message.messageId}');

  if (message.notification != null) {
    LocalNotificationService().showNotifications(
        code: message.hashCode,
        title: message.notification?.title ?? '',
        body: message.notification?.body ?? '',
        payload: jsonEncode(message.data));
  }
}

// Handle remote message in foreground
Future<void> _foregroundHandler(RemoteMessage message, LocalNotificationService localNotificationService) async {
  Logger.i('Got a message whilst in the foreground!');
  Logger.i('Message data: ${message.data}');

  if (message.notification != null) {
    Logger.i('Message also contained a notification: ${message.notification?.body}');

    localNotificationService.showNotifications(
      code: message.hashCode,
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      payload: jsonEncode(message.data),
    );
  }
}

// On message opened app
Future<void> _onMessageOpenedApp(RemoteMessage message) async {
  // TODO Handle push opened app
  Logger.i('got a new message');
}

class ParsePushService {
  static final ParsePushService _instance = ParsePushService._internal();

  factory ParsePushService() {
    return _instance;
  }

  ParsePushService._internal();

  FirebaseMessaging get _firebaseMessaging => FirebaseMessaging.instance;

  Future<void> initialize() async {
    // Initialize Firebase Core
    // TODO add firebase options
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final localNotificationService = LocalNotificationService();

    //Get permission to send messages
    await _firebaseMessaging.requestPermission(sound: true);

    // Initialize Parse push notifications
    await ParsePush.instance.initialize(
      _firebaseMessaging,
      parseNotification: ParseNotification(
        onShowNotification: (value) {
          Logger.i(value);
        },
      ),
    );

    // To handle messages while application is in the foreground
    FirebaseMessaging.onMessage.listen(
      (event) => _foregroundHandler(event, localNotificationService),
    );

    // Process push notifications while app is in the background
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // On message opened app
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
  }
}
