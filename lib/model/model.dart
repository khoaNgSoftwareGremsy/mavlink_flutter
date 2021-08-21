import 'dart:ffi'; // For FFI
import 'dart:io'; // For Platform.isX
import 'package:ffi/ffi.dart';

abstract class Model {
  void _init();
  IntPtr _write();
  IntPtr _read();
}
