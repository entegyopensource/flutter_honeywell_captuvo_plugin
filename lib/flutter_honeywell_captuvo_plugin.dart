import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

enum ProtocolConnectionStatus {
  protocolConnectionStatusConnected, // A successful connection was made
  protocolConnectionStatusAlreadyConnected, // The protocol is already connected
  protocolConnectionStatusBatteryDepleted, // The protocol is unable to be connected due to low battery
  protocolConnectionStatusUnableToConnectIncompatibleSledFirmware, // The protocol was unable to be connected due to an error
  protocolConnectionStatusUnableToConnect, // The protocol was unable to be connected due to an error
  protocolConnectionUnableToConnectNOAccessary, // Protocol connection fail, the Sled was not connected to apple device
  protocolConnectionUnableToConnectNOProtocal, // does not recognize the specified protocol or there was no corressponding Protocal defined in plist or there was an error communicating with the SLed.

  error,
}

class FlutterHoneywellCaptuvoPlugin {
  static const MethodChannel _methodChannel = const MethodChannel('flutter_honeywell_captuvo_plugin_method_channel');
  static const EventChannel _eventChannel = const EventChannel('flutter_honeywell_captuvo_plugin_event_channel');
  static Stream<Map<String, dynamic>> _eventStrem;

  static Future<ProtocolConnectionStatus> startDecoderHardware() async {
    final String statusIndex = await _methodChannel.invokeMethod('startDecoderHardware');
    return ProtocolConnectionStatus.values[int.tryParse(statusIndex) ?? (ProtocolConnectionStatus.values.length - 1)];
  }

  static Future<void> stopDecoderHardware() async {
    await _methodChannel.invokeMethod('stopDecoderHardware');
  }

  static Future<void> startDecoderScanning() async {
    await _methodChannel.invokeMethod('startDecoderScanning');
  }

  static Future<void> stopDecoderScanning() async {
    await _methodChannel.invokeMethod('stopDecoderScanning');
  }

  static Stream<Map<String, dynamic>> get _decoderEventStream {
    if (_eventStrem == null) {
      _eventStrem = _eventChannel.receiveBroadcastStream().map((msg) => jsonDecode(msg));
    }
    return _eventStrem;
  }

  static Stream<bool> get decoderConnectionStream => _decoderEventStream.where((msg) => msg["event"] == "connection").map((msg) => msg["isConnected"]);

  static Stream<String> get decoderScanDataStream => _decoderEventStream.where((msg) => msg["event"] == "dataReceived").map((msg) => msg["data"]);
}
