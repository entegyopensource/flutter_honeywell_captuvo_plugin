package au.com.entegy.flutter_honeywell_captuvo_plugin;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterHoneywellCaptuvoPlugin */
public class FlutterHoneywellCaptuvoPlugin implements FlutterPlugin, MethodCallHandler, StreamHandler {
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    final FlutterHoneywellCaptuvoPlugin plugin = new FlutterHoneywellCaptuvoPlugin();

    final MethodChannel methodChannel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "flutter_honeywell_captuvo_plugin_method_channel");
    methodChannel.setMethodCallHandler(plugin);
    
    final EventChannel eventChannel = new EventChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "flutter_honeywell_captuvo_plugin_event_channel");
    eventChannel.setStreamHandler(plugin);
  }

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  public static void registerWith(Registrar registrar) {
    final FlutterHoneywellCaptuvoPlugin plugin = new FlutterHoneywellCaptuvoPlugin();

    final MethodChannel methodChannel = new MethodChannel(registrar.messenger(), "flutter_honeywell_captuvo_plugin_method_channel");
    methodChannel.setMethodCallHandler(plugin);
    
    final EventChannel eventChannel = new EventChannel(registrar.messenger(), "flutter_honeywell_captuvo_plugin_event_channel");
    eventChannel.setStreamHandler(plugin);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("startDecoderHardware")) {
      result.success("7"); // ProtocolConnectionStatus.notSupported
    } else if (call.method.equals("stopDecoderHardware")) {
      result.success(null);
    } else if (call.method.equals("startDecoderScanning")) {
      result.success(null);
    } else if (call.method.equals("stopDecoderScanning")) {
      result.success(null);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onListen(Object arguments, EventSink events) {
  }

  @Override
  public void onCancel(Object arguments) {
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
  }
}
