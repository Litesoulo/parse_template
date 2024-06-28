import '../../../generated/strings.g.dart';
import '../../domain/use_case/use_case.dart';
import '../../sl.dart';
import 'src/login/store/login_store.dart';

class InitStoresUseCase implements UseCase {
  @override
  Future<void> call({params}) async {
    // TODO Set initial locale
    String? storedLocale = loadLocaleFromStorage();
    if (storedLocale == null) {
      LocaleSettings.useDeviceLocale();
    } else {
      LocaleSettings.setLocaleRaw(storedLocale);
    }

    sl.registerSingleton<LoginStore>(
      LoginStore(),
    );
  }
}

String? loadLocaleFromStorage() {
  // TODO add locale from storage logic
  return null;
}
