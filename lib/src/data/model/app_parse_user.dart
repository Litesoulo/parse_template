import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AppParseUser extends ParseUser implements ParseCloneable {
  AppParseUser({
    String? username,
    String? password,
    String? emailAddress,
  }) : super(username, password, emailAddress);

  AppParseUser.clone() : this();

  @override
  AppParseUser clone(Map<String, dynamic> map) => AppParseUser.clone()..fromJson(map);
}
