import '../../domain/use_case/use_case.dart';
import '../../sl.dart';
import 'src/repository.dart';

class InitRepositoryUseCase implements UseCase {
  @override
  Future<void> call({params}) async {
    sl.registerSingleton<UserRepository>(
      UserRepository(
        api: UserApi(),
      ),
    );
  }
}
