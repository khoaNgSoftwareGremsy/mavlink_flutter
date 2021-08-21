import 'dart:io';
import 'dart:ffi';
import 'dart:async';
import 'package:ffi/ffi.dart';

////////////////////////////////
///this library contain all struct to use to communicate with gimbal of gremsy
///
/*
 * @brief System information
 * @details This structure type is used to
 */
class system_info_t extends Struct {
  @Uint8()
  external int x; /* Major Version*/

  @Uint8()
  external int y; /* Minor Version*/

  @Uint8()
  external int z; /* Sub-Minor Version*/

  @Uint16()
  external int type;

  external Pointer<Utf8> model;
}
