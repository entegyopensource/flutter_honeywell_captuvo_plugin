# Flutter Honeywell Captuvo Plugin

Flutter wrapper for the Honeywell Captuvo SL22/42 iOS API.

## Usage
```dart
import 'package:flutter_honeywell_captuvo_plugin/captuvo_plugin.dart';

@override
void initState() {
  super.initState();
  CaptuvoPlugin.startDecoderHardware();
}

@override
Widget build(BuildContext context) {
  return StreamBuilder<String>(
    stream: CaptuvoPlugin.decoderScanDataStream,
    builder: (_, snapshot) => Text('Last scan data: ${snapshot.data}'),
  );
}
```

See the provided example app for more.

