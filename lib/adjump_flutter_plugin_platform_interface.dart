import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'adjump_flutter_plugin_method_channel.dart';

abstract class AdjumpFlutterPluginPlatform extends PlatformInterface {
  /// Constructs a AdjumpFlutterPluginPlatform.
  AdjumpFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static AdjumpFlutterPluginPlatform _instance = MethodChannelAdjumpFlutterPlugin();

  /// The default instance of [AdjumpFlutterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelAdjumpFlutterPlugin].
  static AdjumpFlutterPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AdjumpFlutterPluginPlatform] when
  /// they register themselves.
  static set instance(AdjumpFlutterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
