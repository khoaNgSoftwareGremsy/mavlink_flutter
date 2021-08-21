// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;
import 'dart:typed_data';
import 'package:libserialport/libserialport.dart';
import 'dart:convert';
// import 'package:mavlink_test/helper/serial.dart';
import 'package:mavlink_test/helper/mavlink_msg.dart';
import 'package:mavlink_test/helper/flutter_mavlink.dart';

void main() {
  final name = SerialPort.availablePorts.first;
  final port = SerialPort(name);
  if (!port.openReadWrite()) {
    print(SerialPort.lastError);
  }

  final reader = SerialPortReader(port);
  reader.stream.listen((data) {});
}
