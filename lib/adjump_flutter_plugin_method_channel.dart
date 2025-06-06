import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'adjump_flutter_plugin_platform_interface.dart';

/// An implementation of [AdjumpFlutterPluginPlatform] that uses method channels.
class MethodChannelAdjumpFlutterPlugin extends AdjumpFlutterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('adjump_flutter_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
