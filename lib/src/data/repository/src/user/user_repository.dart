import '../../../base/api_response.dart';
import '../../../model/user.dart';
import 'user_api.dart';

class UserRepository {
  final UserApi _api;

  UserRepository({
    required UserApi api,
  }) : _api = api;

  Future<ApiResponse?>? login(User user) => _api.login(user);

  Future<void> logout(User user) async => await _api.logout(user);

  Future<User?>? currentUser() async => await _api.currentUser();

  Future<ApiResponse?>? getCurrentUserFromServer() async => await _api.getCurrentUserFromServer();
}
