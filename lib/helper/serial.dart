import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:libserialport/libserialport.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class gSerialPort {
  String portName;
  int baudRate;
  SerialPort? _port;

  // factory gSerialPort() => _getInstance();
  // static gSerialPort get instace => _getInstance();
  // gSerialPort._internal() {
  //   _initPort();
  // }

  // static gSerialPort _getInstance() {
  //   if (_instance == null) {
  //     _instance = gSerialPort._internal();
  //   }
  //   return _instance;
  // }

  // _initPort() async {
  //   await
  // }

  gSerialPort({
    required this.portName,
    required this.baudRate,
  }) {
    Init();
  }
  @override
  void Init() async {
    _port = SerialPort
    // _port = SerialPort(portName);
    // SerialPortConfig portConfig = SerialPortConfig();
    // portConfig.stopBits = 1;
    // portConfig.bits = 8;
    // portConfig.setFlowControl(SerialPortFlowControl.none);
    // switch (baudRate) {
    //   case 9600:
    //     portConfig.baudRate = 9600;
    //     break;
    //   case 14400:
    //     portConfig.baudRate = 14400;
    //     break;
    //   case 19200:
    //     portConfig.baudRate = 19200;
    //     break;
    //   case 38400:
    //     portConfig.baudRate = 38400;
    //     break;
    //   case 56000:
    //     portConfig.baudRate = 56000;
    //     break;
    //   case 57600:
    //     portConfig.baudRate = 57600;
    //     break;
    //   case 115200:
    //     portConfig.baudRate = 115200;
    //     break;
    //   default:
    //     break;
    // }
    // _port!.config = portConfig;
  }

  //write interface to assign with mavlink
  void write(Pointer<Utf8> buffer, int length) {
    //transfer char* to string in dart
    String strBuff = buffer.toDartString(length: length);
    //convert string to uint8list
    List<int> units = utf8.encode(strBuff);
    Uint8List uint8Buff = Uint8List.fromList(units);
    try {
      _port!.write(uint8Buff, timeout: 10);
    } on SerialPortError catch (e) {
      print(SerialPort.lastError);
    }
  }

  Uint8List Read() {
    final reader = SerialPortReader(_port!);
    Uint8List buffer;
    reader.stream.listen((buffer) {
      print("data received: ${buffer}");
    });
    return buffer;
  }
}
