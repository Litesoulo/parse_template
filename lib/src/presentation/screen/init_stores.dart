import '../../domain/use_case/use_case.dart';
import '../../sl.dart';
import 'src/login/store/login_store.dart';

class InitStoresUseCase implements UseCase {
  @override
  Future<void> call({params}) async {
    sl.registerSingleton<LoginStore>(
      LoginStore(),
    );
  }
}
