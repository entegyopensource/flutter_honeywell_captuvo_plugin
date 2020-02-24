import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_honeywell_captuvo_plugin/flutter_honeywell_captuvo_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription decoderConnectionStreamubscription;

  @override
  void initState() {
    super.initState();
    CaptuvoPlugin.startDecoderHardware();
    decoderConnectionStreamubscription = CaptuvoPlugin.decoderConnectionStream.listen((isConnected) {
      if (isConnected) {
        CaptuvoPlugin.startDecoderHardware();
      }
    });
  }

  @override
  void dispose() {
    decoderConnectionStreamubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Captuvo SL42 API Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder<bool>(
                  stream: CaptuvoPlugin.decoderConnectionStream,
                  initialData: false,
                  builder: (_, snapshot) => Text('Decoder is ${snapshot.data ? "Conencted" : "Disconnected"}'),
                ),
                const SizedBox(height: 10.0),
                StreamBuilder<String>(
                  stream: CaptuvoPlugin.decoderScanDataStream,
                  initialData: "NONE",
                  builder: (_, snapshot) => Text('Last scan data: ${snapshot.data}'),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: GestureDetector(
          child: Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Icon(Icons.scanner),
          ),
          onTapDown: (_) => CaptuvoPlugin.startDecoderScanning(),
          onTapUp: (_) => CaptuvoPlugin.stopDecoderScanning(),
        ),
      ),
    );
  }
}
