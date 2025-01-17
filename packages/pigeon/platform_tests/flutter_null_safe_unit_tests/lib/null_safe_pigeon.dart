// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//
// Autogenerated from Pigeon (v4.2.7), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import
import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

class FlutterSearchRequest {
  FlutterSearchRequest({
    this.query,
  });

  String? query;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['query'] = query;
    return pigeonMap;
  }

  static FlutterSearchRequest decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return FlutterSearchRequest(
      query: pigeonMap['query'] as String?,
    );
  }
}

class FlutterSearchReply {
  FlutterSearchReply({
    this.result,
    this.error,
  });

  String? result;
  String? error;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['result'] = result;
    pigeonMap['error'] = error;
    return pigeonMap;
  }

  static FlutterSearchReply decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return FlutterSearchReply(
      result: pigeonMap['result'] as String?,
      error: pigeonMap['error'] as String?,
    );
  }
}

class FlutterSearchRequests {
  FlutterSearchRequests({
    this.requests,
  });

  List<Object?>? requests;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['requests'] = requests;
    return pigeonMap;
  }

  static FlutterSearchRequests decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return FlutterSearchRequests(
      requests: pigeonMap['requests'] as List<Object?>?,
    );
  }
}

class FlutterSearchReplies {
  FlutterSearchReplies({
    this.replies,
  });

  List<Object?>? replies;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['replies'] = replies;
    return pigeonMap;
  }

  static FlutterSearchReplies decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return FlutterSearchReplies(
      replies: pigeonMap['replies'] as List<Object?>?,
    );
  }
}

class _ApiCodec extends StandardMessageCodec {
  const _ApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is FlutterSearchReplies) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is FlutterSearchReply) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is FlutterSearchRequest) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is FlutterSearchRequests) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return FlutterSearchReplies.decode(readValue(buffer)!);

      case 129:
        return FlutterSearchReply.decode(readValue(buffer)!);

      case 130:
        return FlutterSearchRequest.decode(readValue(buffer)!);

      case 131:
        return FlutterSearchRequests.decode(readValue(buffer)!);

      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class Api {
  /// Constructor for [Api].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  Api({BinaryMessenger? binaryMessenger}) : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _ApiCodec();

  Future<FlutterSearchReply> search(FlutterSearchRequest arg_request) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.Api.search', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_request]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else if (replyMap['result'] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyMap['result'] as FlutterSearchReply?)!;
    }
  }

  Future<FlutterSearchReplies> doSearches(
      FlutterSearchRequests arg_request) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.Api.doSearches', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_request]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else if (replyMap['result'] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyMap['result'] as FlutterSearchReplies?)!;
    }
  }

  Future<FlutterSearchRequests> echo(FlutterSearchRequests arg_requests) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.Api.echo', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_requests]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else if (replyMap['result'] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyMap['result'] as FlutterSearchRequests?)!;
    }
  }

  Future<int> anInt(int arg_value) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.Api.anInt', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_value]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else if (replyMap['result'] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyMap['result'] as int?)!;
    }
  }
}
