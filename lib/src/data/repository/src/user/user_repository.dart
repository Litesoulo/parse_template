import '../../../base/api_response.dart';
import '../../../model/src/app_parse_user.dart';
import 'user_api.dart';

class UserRepository {
  final UserApi _api;

  UserRepository({
    required UserApi api,
  }) : _api = api;

  Future<ApiResponse?>? login(AppParseUser user) => _api.login(user);

  Future<void> logout(AppParseUser user) async => await _api.logout(user);

  Future<AppParseUser?>? currentUser() async => await _api.currentUser();

  Future<ApiResponse?>? getCurrentUserFromServer() async => await _api.getCurrentUserFromServer();
}
