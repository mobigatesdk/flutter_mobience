///User/device identifiers
enum UserField { EMAIL, IMSI, MAC, IMEI, SERIAL }

///Defines how the library works
enum MonitorState { DEFAULT, HIDE_TRAY, BLOCK_DATA_BG }

extension MonitorStateExtension on MonitorState {
  String get name {
    switch (this) {
      case MonitorState.DEFAULT:
        return 'DEFAULT';
      case MonitorState.HIDE_TRAY:
        return 'HIDE_TRAY';
      case MonitorState.BLOCK_DATA_BG:
        return 'BLOCK_DATA_BG';
      default:
        return '';
    }
  }
}

extension UserFieldExtension on UserField {
  String get name {
    switch (this) {
      case UserField.EMAIL:
        return 'EMAIL';
      case UserField.IMSI:
        return 'IMSI';
      case UserField.MAC:
        return 'MAC';
      case UserField.IMEI:
        return 'IMEI';
      case UserField.SERIAL:
        return 'SERIAL';
      default:
        return '';
    }
  }
}
