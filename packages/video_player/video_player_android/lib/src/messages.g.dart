// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Autogenerated from Pigeon (v22.7.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse({
  Object? result,
  PlatformException? error,
  bool empty = false,
}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

/// Pigeon equivalent of VideoViewType.
enum PlatformVideoViewType { textureView, platformView }

/// Information passed to the platform view creation.
class PlatformVideoViewCreationParams {
  PlatformVideoViewCreationParams({required this.playerId});

  int playerId;

  Object encode() {
    return <Object?>[playerId];
  }

  static PlatformVideoViewCreationParams decode(Object result) {
    result as List<Object?>;
    return PlatformVideoViewCreationParams(playerId: result[0]! as int);
  }
}

class CreateMessage {
  CreateMessage({
    this.asset,
    this.uri,
    this.packageName,
    this.formatHint,
    required this.httpHeaders,
    this.viewType,
  });

  String? asset;

  String? uri;

  String? packageName;

  String? formatHint;

  Map<String, String> httpHeaders;

  PlatformVideoViewType? viewType;

  Object encode() {
    return <Object?>[
      asset,
      uri,
      packageName,
      formatHint,
      httpHeaders,
      viewType,
    ];
  }

  static CreateMessage decode(Object result) {
    result as List<Object?>;
    return CreateMessage(
      asset: result[0] as String?,
      uri: result[1] as String?,
      packageName: result[2] as String?,
      formatHint: result[3] as String?,
      httpHeaders:
          (result[4] as Map<Object?, Object?>?)!.cast<String, String>(),
      viewType: result[5] as PlatformVideoViewType?,
    );
  }
}

class _PigeonCodec extends StandardMessageCodec {
  const _PigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is int) {
      buffer.putUint8(4);
      buffer.putInt64(value);
    } else if (value is PlatformVideoViewType) {
      buffer.putUint8(129);
      writeValue(buffer, value.index);
    } else if (value is PlatformVideoViewCreationParams) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is CreateMessage) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 129:
        final int? value = readValue(buffer) as int?;
        return value == null ? null : PlatformVideoViewType.values[value];
      case 130:
        return PlatformVideoViewCreationParams.decode(readValue(buffer)!);
      case 131:
        return CreateMessage.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class AndroidVideoPlayerApi {
  /// Constructor for [AndroidVideoPlayerApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  AndroidVideoPlayerApi({
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) : pigeonVar_binaryMessenger = binaryMessenger,
       pigeonVar_messageChannelSuffix =
           messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? pigeonVar_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  final String pigeonVar_messageChannelSuffix;

  Future<void> initialize() async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.video_player_android.AndroidVideoPlayerApi.initialize$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<int> create(CreateMessage msg) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.video_player_android.AndroidVideoPlayerApi.create$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[msg]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as int?)!;
    }
  }

  Future<void> dispose(int playerId) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.video_player_android.AndroidVideoPlayerApi.dispose$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[playerId]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setLooping(int playerId, bool looping) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.video_player_android.AndroidVideoPlayerApi.setLooping$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[playerId, looping])
            as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setVolume(int playerId, double volume) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.video_player_android.AndroidVideoPlayerApi.setVolume$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[playerId, volume])
            as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setPlaybackSpeed(int playerId, double speed) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.video_player_android.AndroidVideoPlayerApi.setPlaybackSpeed$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[playerId, speed])
            as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> play(int playerId) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.video_player_android.AndroidVideoPlayerApi.play$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[playerId]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<int> position(int playerId) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.video_player_android.AndroidVideoPlayerApi.position$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[playerId]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as int?)!;
    }
  }

  Future<void> seekTo(int playerId, int position) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.video_player_android.AndroidVideoPlayerApi.seekTo$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[playerId, position])
            as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> pause(int playerId) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.video_player_android.AndroidVideoPlayerApi.pause$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[playerId]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setMixWithOthers(bool mixWithOthers) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.video_player_android.AndroidVideoPlayerApi.setMixWithOthers$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[mixWithOthers])
            as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setAllowBackgroundPlayback(bool allowBackgroundPlayback) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.video_player_android.AndroidVideoPlayerApi.setAllowBackgroundPlayback$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[allowBackgroundPlayback])
            as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }
}
