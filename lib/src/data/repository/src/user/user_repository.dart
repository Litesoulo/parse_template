import '../../../base/api_response.dart';
import '../../../model/src/custom_parse_user.dart';
import 'user_api.dart';

class UserRepository {
  final UserApi _api;

  UserRepository({
    required UserApi api,
  }) : _api = api;

  Future<ApiResponse?>? login(CustomParseUser user) => _api.login(user);

  Future<void> logout(CustomParseUser user) async => await _api.logout(user);

  Future<CustomParseUser?>? currentUser() async => await _api.currentUser();

  Future<ApiResponse?>? getCurrentUserFromServer() async => await _api.getCurrentUserFromServer();
}
