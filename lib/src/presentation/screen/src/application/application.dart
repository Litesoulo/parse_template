import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../../generated/strings.g.dart';
import '../../../../core/config/localization/tk_material_localizations_delegate.dart';
import '../../../../core/config/router/app_router.dart';
import '../../../../sl.dart';
import 'store/connectivity_store.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
      child: _MaterialApp(),
    );
  }
}

class _MaterialApp extends StatelessWidget {
  final ConnectivityStore _connectivityStore = ConnectivityStore();

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (_) => reaction(
        (_) => _connectivityStore.isOnline,
        (isOnline) {
          if (isOnline) {
            // do nothing;
          } else {
            // Todo show messenger
          }
        },
        delay: 4000,
      ),
      child: TranslationProvider(
        child: Builder(builder: (context) {
          return MaterialApp.router(
            routerConfig: sl<AppRouter>().config(),

            // Locale
            locale: TranslationProvider.of(context).flutterLocale,
            localizationsDelegates: const [
              TkMaterialLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            // Disable debug banner
            debugShowCheckedModeBanner: false,
          );
        }),
      ),
    );
  }
}
