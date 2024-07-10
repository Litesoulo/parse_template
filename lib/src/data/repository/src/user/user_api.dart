import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../base/api_response.dart';
import '../../../model/src/custom_parse_user.dart';

class UserApi {
  Future<ApiResponse> login(CustomParseUser user) async {
    return getApiResponse<CustomParseUser>(await user.login());
  }

  Future<CustomParseUser>? currentUser() => ParseUser.currentUser() as Future<CustomParseUser>;

  Future<ApiResponse> getCurrentUserFromServer() async {
    final ParseUser user = await ParseUser.currentUser();

    return getApiResponse<CustomParseUser>(
      await ParseUser.getCurrentUserFromServer(user.get<String>(keyHeaderSessionToken)!),
    );
  }

  Future<ApiResponse> save(CustomParseUser user) async => getApiResponse<CustomParseUser>(await user.save());

  Future<void> logout(CustomParseUser user) async => await user.logout();
}
