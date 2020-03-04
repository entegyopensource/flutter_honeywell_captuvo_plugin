# Flutter Honeywell Captuvo Plugin

Flutter wrapper for the Honeywell Captuvo SL22/42 iOS API.

## Usage
```dart
import 'package:flutter_honeywell_captuvo_plugin/flutter_honeywell_captuvo_plugin.dart';

@override
void initState() {
  super.initState();
  FlutterHoneywellCaptuvoPlugin.startDecoderHardware();
}

@override
Widget build(BuildContext context) {
  return StreamBuilder<String>(
    stream: FlutterHoneywellCaptuvoPlugin.decoderScanDataStream,
    builder: (_, snapshot) => Text('Last scan data: ${snapshot.data}'),
  );
}
```

See the provided example app for more.

