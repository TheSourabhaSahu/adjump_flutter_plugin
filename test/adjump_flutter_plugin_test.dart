import 'package:flutter_test/flutter_test.dart';
import 'package:adjump_flutter_plugin/adjump_flutter_plugin.dart';
import 'package:adjump_flutter_plugin/adjump_flutter_plugin_platform_interface.dart';
import 'package:adjump_flutter_plugin/adjump_flutter_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAdjumpFlutterPluginPlatform
    with MockPlatformInterfaceMixin
    implements AdjumpFlutterPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AdjumpFlutterPluginPlatform initialPlatform = AdjumpFlutterPluginPlatform.instance;

  test('$MethodChannelAdjumpFlutterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAdjumpFlutterPlugin>());
  });

  test('getPlatformVersion', () async {
    AdjumpFlutterPlugin adjumpFlutterPlugin = AdjumpFlutterPlugin();
    MockAdjumpFlutterPluginPlatform fakePlatform = MockAdjumpFlutterPluginPlatform();
    AdjumpFlutterPluginPlatform.instance = fakePlatform;

    expect(await adjumpFlutterPlugin.getPlatformVersion(), '42');
  });
}
