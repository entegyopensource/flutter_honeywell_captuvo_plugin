import 'dart:async';

import 'package:flutter/services.dart';

class FlutterHoneywellCaptuvoPlugin {
  static const MethodChannel _channel = const MethodChannel('flutter_honeywell_captuvo_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
