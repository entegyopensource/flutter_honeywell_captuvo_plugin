#import "FlutterHoneywellCaptuvoPlugin.h"

@implementation FlutterHoneywellCaptuvoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_honeywell_captuvo_plugin"
            binaryMessenger:[registrar messenger]];
  FlutterHoneywellCaptuvoPlugin* instance = [[FlutterHoneywellCaptuvoPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
