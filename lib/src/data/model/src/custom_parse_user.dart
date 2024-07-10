import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class CustomParseUser extends ParseUser implements ParseCloneable {
  CustomParseUser({
    String? username,
    String? password,
    String? emailAddress,
  }) : super(username, password, emailAddress);

  CustomParseUser.clone() : this();

  @override
  CustomParseUser clone(Map<String, dynamic> map) => CustomParseUser.clone()..fromJson(map);

  static const String keyDeviceToken = 'deviceToken';
  static const String keyAdminId = 'adminId';

  String get deviceToken => get<String>(keyDeviceToken) ?? '';
  set deviceToken(String newToken) => set<String>(keyDeviceToken, newToken);

  String get adminId => get<String>(keyAdminId) ?? '';
  set adminId(String newAdminId) => set<String>(keyAdminId, newAdminId);
}
