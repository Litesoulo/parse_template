import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../base/api_response.dart';
import '../../../model/src/app_parse_user.dart';

class UserApi {
  Future<ApiResponse> login(AppParseUser user) async {
    return getApiResponse<AppParseUser>(await user.login());
  }

  Future<AppParseUser>? currentUser() => ParseUser.currentUser() as Future<AppParseUser>;

  Future<ApiResponse> getCurrentUserFromServer() async {
    final ParseUser user = await ParseUser.currentUser();

    return getApiResponse<AppParseUser>(
      await ParseUser.getCurrentUserFromServer(user.get<String>(keyHeaderSessionToken)!),
    );
  }

  Future<ApiResponse> save(AppParseUser user) async => getApiResponse<AppParseUser>(await user.save());

  Future<void> logout(AppParseUser user) async => await user.logout();
}
