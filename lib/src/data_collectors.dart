///Data collectors
class DataCollector {
  /// Collect all application's info on device<br>
  /// Optional permission:<br>
  /// android.permission.GET_PACKAGE_SIZE
  static const APPS_LIST = 0;

  /// Class collect time active an application<br>
  /// Required permissions:<br>
  /// android.permission.PACKAGE_USAGE_STATS (obligatory on android sdk >= Lollipop 5.0)
  /// android.permission.GET_TASKS (obligatory on android sdk <= Kitkat 4.4)
  static const APPS_USAGE = 1;

  /// BatteryInfoCollector collects battery info: level; and charge event
  static const BATTERY = 2;

  /// Collecting data on browser history, bookmarks, pharses<br>
  /// Required permissions:<br>
  /// com.android.browser.permission.READ_HISTORY_BOOKMARKS (Removed since android sdk >= Marshmallow 6.0) on Android api level < Lollipop 5.0
  /// turned on accessibility for application on Android api level >= Lollipop 5.0
  static const BROWSER = 3;

  /// Collects calendar events data of a device, with a range of days : before 100 days and after 100 days with the collecting day<br>
  /// Required permissions:<br>
  /// android.permission.READ_CALENDAR
  static const CALENDAR_EVENTS = 4;

  /// Collect process running cpu on device at time request
  static const CPU_PROCESS = 6;

  /// Collect all data Dictionary of user on device<br>
  /// Required permissions:<br>
  /// android.permission.READ_USER_DICTIONARY
  static const DICTIONARY = 7;

  /// Geolocalization coordinates of a device, information of current GSM cell and GSM signal strength<br>
  /// Required permissions:<br>
  /// android.permission.ACCESS_FINE_LOCATION or android.permission.ACCESS_COARSE_LOCATION
  static const GEOLOCATION = 8;

  /// Collect all data about headset plugin's information
  static const HEADSET_PLUG = 9;

  /// Gather Media files information of device<br>
  /// Required permissions:<br>
  /// android.permission.WRITE_EXTERNAL_STORAGE3
  /// android.permission.READ_EXTERNAL_STORAGE3 (on Android api level >= Jelly Bean 4.1)
  static const MEDIA_FILES = 10;

  /// Collect used memory info
  static const MEMORY_USEAGE = 11;

  /// Collect about connection information: "wifi" or "mobile data" or "no connection"<br>
  /// Required permissions:<br>
  /// android.permission.ACCESS_NETWORK_STATE
  static const NETWORK_CONNECTION = 13;

  /// Collect all network usage data from all application on device
  static const NETWORK_USEAGE = 14;

  /// Collect all package change event (install new app, remove app, data clear, restart app)
  static const PACKAGE_CHANGE = 15;

  /// Collect informations of a device, such as: Identifiers of device model, system version, IMSI, IP, network operator of SIM card and mobile network, WiFi network data, etc.<br>
  /// Optional permission:<br>
  /// android.permission.READ_PHONE_STATE
  /// android.permission.ACCESS_NETWORK_STATE
  /// android.permission.ACCESS_WIFI_STATE
  static const PHONE_INFO = 16;

  /// Catch event roaming<br>
  /// Required permissions:<br>
  /// android.permission.ACCESS_NETWORK_STATE
  static const ROAMING = 17;

  /// Collect data about device's orientation
  static const SCREEN_ORIENTED = 18;

  /// Collect phone signal info
  static const SIGNAL_STRENGTH = 19;

  /// Collect time change profile mode
  static const PROFILE_MODE = 20;

  /// Gather list of visible WiFi networks, information of each wifi<br>
  /// Required permission:<br>
  /// android.permission.ACCESS_WIFI_STATE
  /// Android <= 8.1 (sdk level <= 27):
  /// android.permission.ACCESS_FINE_LOCATION or android.permission.ACCESS_COARSE_LOCATION
  /// android.permission.CHANGE_WIFI_STATE
  /// Android 9.0, 10 (sdk level 28, 29)
  /// enabled location services
  /// Applications targeting Android 10 (API level 29) SDK or higher, has the android.permission.ACCESS_FINE_LOCATION
  static const WIFI_DATA_CONNECTION = 21;

  /// SDKApp
  /// ion gathers every week list of all the Android permissions that it have and list of enabled data collectors from MobienceSDK
  static const PERMISSION_COLLECTOR = 22;

  /// NFC collector collects information of NFC funtion of that device, contains normal NFC NFED information<br>
  /// Required permissions:<br>
  /// android.permission.NFC
  static const NFC_COLLECTOR = 23;

  /// Bluetooth collector collects information of Bluetooth funtion of that device, contains normal Bluetooth information<br>
  /// Required permissions:<br>
  /// android.permission.BLUETOOTH
  static const BLUETOOTH_COLLECTOR = 24;

  /// Bluetooth device collector collects information of detecting connected devices via bluetooth<br>
  /// Required permissions:<br>
  /// android.permission.BLUETOOTH
  static const BLUETOOTH_DEVICES_COLLECTOR = 26;

  /// Activity recognition collector collects information about detected user activities (walking, running, driving, etc.)<br>
  /// Required permission:<br>
  /// com.google.android.gms.permission.ACTIVITY_RECOGNITION
  static const MOVEMENT_COLLECTOR = 27;

  /// Facebook collector collect information about user
  static const FACEBOOK_NETWORK_COLLECTOR = 28;

  /// Root data collector collects information if device is rooted
  static const ROOT_COLLECTOR = 29;

  /// USB data collector collects information about connected USB devices
  static const USB_COLLECTOR = 30;
}
