import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class User extends ParseUser implements ParseCloneable {
  User({
    String? username,
    String? password,
    String? emailAddress,
  }) : super(username, password, emailAddress);

  User.clone() : this();

  @override
  User clone(Map<String, dynamic> map) => User.clone()..fromJson(map);
}
