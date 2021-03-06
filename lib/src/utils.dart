// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';

/// Whether this computer supports binding to IPv6 addresses.
final Future<bool> supportsIPv6 = () async {
  try {
    var socket = await ServerSocket.bind(InternetAddress.loopbackIPv6, 0);
    unawaited(socket.close());
    return true;
  } on SocketException catch (_) {
    return false;
  }
}();

/// Whether this computer supports binding to IPv4 addresses.
final Future<bool> supportsIPv4 = () async {
  try {
    var socket = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
    unawaited(socket.close());
    return true;
  } on SocketException catch (_) {
    return false;
  }
}();

// Avoids a normal dependencies on `package:pedantic`.
void unawaited(Future<void> f) {}
