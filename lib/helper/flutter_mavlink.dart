import 'dart:io' show Platform, Directory;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:mavlink_test/helper/serial.dart';
import 'package:path/path.dart' as path;
import 'package:mavlink_test/helper/mavlink_msg.dart';
import 'package:path/path.dart';
// abstract class mavlink_channel_t {}

typedef helloworldFunc = Void Function();
typedef helloworld_ = void Function();

typedef mavlink_parse_char_func = Uint8 Function(
    Uint8 chan,
    Uint8 c,
    Pointer<mavlink_message_t> r_message,
    Pointer<mavlink_status_t> r_mavlink_status);

typedef mavlink_parse_char_ = int Function(
    int chan,
    int c,
    Pointer<mavlink_message_t> r_message,
    Pointer<mavlink_status_t> r_mavlink_status);

typedef gremsy_mavlink_init_func = Void Function(
    Pointer<gremsy_mavlink_handler_t> handler);

typedef gremsy_mavlink_init_ = void Function(
    Pointer<gremsy_mavlink_handler_t> handler);

var libraryPath =
    path.join(Directory.current.path, 'mavlink_library', 'libgsdkMavlink.so');

final DynamicLibrary flutterMavlinkLib = DynamicLibrary.open(libraryPath);

/*
* mavlink_parser_char / 
 */

final mavlink_parse_char_pointer = flutterMavlinkLib
    .lookup<NativeFunction<mavlink_parse_char_func>>("mavlink_parse_char");
final mavlink_parse_char =
    mavlink_parse_char_pointer.asFunction<mavlink_parse_char_>();

/*
* gremsy_mavlink_init / gsdk_mavlink.h 
 */

final gremsy_mavlink_init_pointer = flutterMavlinkLib
    .lookup<NativeFunction<gremsy_mavlink_init_func>>('gremsy_mavlink_init');
final gremsy_mavlink_init =
    gremsy_mavlink_init_pointer.asFunction<gremsy_mavlink_init_>();
