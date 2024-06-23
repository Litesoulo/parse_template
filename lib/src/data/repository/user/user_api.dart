import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../base/api_response.dart';
import '../../model/user.dart';

class UserApi {
  Future<ApiResponse> login(User user) async {
    return getApiResponse<User>(await user.login());
  }

  Future<User>? currentUser() {
    return ParseUser.currentUser() as Future<User>;
  }

  Future<ApiResponse> getCurrentUserFromServer() async {
    final ParseUser user = await ParseUser.currentUser();
    return getApiResponse<User>(await ParseUser.getCurrentUserFromServer(user.get<String>(keyHeaderSessionToken)!));
  }

  Future<ApiResponse> save(User user) async {
    return getApiResponse<User>(await user.save());
  }

  Future<void> logout(User user) async => await user.logout();
}
