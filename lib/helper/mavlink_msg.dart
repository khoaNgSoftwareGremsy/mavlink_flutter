import 'dart:ffi';
import 'package:ffi/ffi.dart';

const int MAVLINK_MAX_PAYLOAD_LEN = 255;
const int MAVLINK_NUM_CHECKSUM_BYTES = 2;
const int MAVLINK_MSG_ID_HEARTBEAT = 0;
const int MAVLINK_SIGNATURE_BLOCK_LEN = 13;

/**/
class mavlink_parse_state_t extends Struct {
  static const int MAVLINK_PARSE_STATE_UNINIT = 0;
  static const int MAVLINK_PARSE_STATE_IDLE = 1;
  static const int MAVLINK_PARSE_STATE_GOT_STX = 2;
  static const int MAVLINK_PARSE_STATE_GOT_LENGTH = 3;
  static const int MAVLINK_PARSE_STATE_GOT_INCOMPAT_FLAGS = 4;
  static const int MAVLINK_PARSE_STATE_GOT_COMPAT_FLAGS = 5;
  static const int MAVLINK_PARSE_STATE_GOT_SEQ = 6;
  static const int MAVLINK_PARSE_STATE_GOT_SYSID = 7;
  static const int MAVLINK_PARSE_STATE_GOT_COMPID = 8;
  static const int MAVLINK_PARSE_STATE_GOT_MSGID1 = 9;
  static const int MAVLINK_PARSE_STATE_GOT_MSGID2 = 10;
  static const int MAVLINK_PARSE_STATE_GOT_MSGID3 = 11;
  static const int MAVLINK_PARSE_STATE_GOT_PAYLOAD = 12;
  static const int MAVLINK_PARSE_STATE_GOT_CRC1 = 13;
  static const int MAVLINK_PARSE_STATE_GOT_BAD_CRC1 = 14;
  static const int MAVLINK_PARSE_STATE_SIGNATURE_WAIT = 15;
}

class mavlink_message_t extends Struct {
  @Uint16()
  external int checksum;

  @Uint8()
  external int magic;

  @Uint8()
  external int len;

  @Uint8()
  external int incompat_flags;

  @Uint8()
  external int compat_flags;

  @Uint8()
  external int seg;

  @Array(33) //(MAVLINK_MAX_PAYLOAD_LEN + MAVLINK_NUM_CHECKSUM_BYTES + 7) / 8
  external Array<Uint64> payload64;

  @Array(2)
  external Array<Uint8> ck;

  @Array(13) //MAVLINK_SIGNATURE_BLOCK_LEN
  external Array<Uint8> signature;
}

/**/

class mavlink_status_t extends Struct {
  @Uint8()
  external int msg_received;

  ///< Number of received messages

  @Uint8()
  external int buffer_overrun;

  ///< Number of buffer overruns

  @Uint8()
  external int parse_error;

  ///< Number of parse errors

  external mavlink_parse_state_t parse_state;

  ///< Parsing state machine

  @Uint8()
  external int packet_idx;

  ///< Index in current packet

  @Uint8()
  external int current_rx_seq;

  ///< Sequence number of last packet received

  @Uint8()
  external int current_tx_seq;

  ///< Sequence number of last packet sent

  @Uint16()
  external int packet_rx_success_count;

  ///< Received packets

  @Uint16()
  external int packet_rx_drop_count;

  ///< Number of packet drops

  @Uint8()
  external int flags;

  ///< MAVLINK_STATUS_FLAG_*

  @Uint8()
  external int signature_wait;

  ///< number of signature bytes left to receive

  // @Pointer<>()
  // external Struct __mavlink_signing *signing;  ///< optional signing state
  // struct __mavlink_signing_streams *signing_streams; ///< global record of stream timestamps
}

class mavlink_heartbeat_t extends Struct {
  @Uint32()
  external int custom_mode;

  @Uint8()
  external int type;

  @Uint8()
  external int autopilot_mode;

  @Uint8()
  external int base_mode;

  @Uint8()
  external int system_status;

  @Uint8()
  external int mavlink_version;
}

class gremsy_mavlink_handler_t extends Struct {
  @Uint8()
  external int version;

  // external mavlink_channel_t chan;

  @Uint8()
  external int chan;

  external IntPtr write(Pointer<Utf8> buf, Uint16 len);

  // external ffi.IntPtr read(ffi.Pointer<Utf8> buf, ffi.Uint16 len);
}
