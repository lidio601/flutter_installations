
import 'dart:async';

import 'package:flutter/services.dart';

class FirebaseInstallations {
  static const MethodChannel _channel =
      const MethodChannel('firebase_installations');

  static Future<String?> get id async {
    final String? id = await _channel.invokeMethod('getId');
    return id;
  }

  static Future<void> deleteInstallationId() async {
    await _channel.invokeMethod('delete');
  }
}
