
import 'adjump_flutter_plugin_platform_interface.dart';

import 'dart:async';
import 'package:flutter/services.dart';

/// Dart API surface for the AdJump Offerwall SDK.
class AdjumpFlutterPlugin {
  static const MethodChannel _channel =
  MethodChannel('adjump_flutter_plugin');

  /// Initialize the native AdJump SDK.
  ///
  /// [accountId], [appId], and [userId] must all be non-null.
  static Future<void> initialize({
    required String accountId,
    required String appId,
    required String userId,
  }) async {
    if (accountId.isEmpty || appId.isEmpty || userId.isEmpty) {
      throw ArgumentError('accountId, appId, and userId are required');
    }
    await _channel.invokeMethod('initialize', {
      'accountId': accountId,
      'appId': appId,
      'userId': userId,
    });
  }

  /// Launch the AdJump offerwall. Must call [initialize] first.
  static Future<void> launchOfferWall() async {
    await _channel.invokeMethod('launchOfferWall');
  }
}
