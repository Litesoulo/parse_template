import '../../../generated/strings.g.dart';
import '../../data/repository/src/news/news_repository.dart';
import '../../domain/use_case/use_case.dart';
import '../../sl.dart';
import 'src/login/store/login_store.dart';
import 'src/news/store/news_store.dart';

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

    // Stores
    sl.registerSingleton<LoginStore>(
      LoginStore(),
    );

    sl.registerSingleton<NewsStore>(
      NewsStore(
        repository: sl<NewsRepository>(),
      )..getItems(),
    );
  }
}

String? loadLocaleFromStorage() {
  // TODO add locale from storage logic
  return null;
}
