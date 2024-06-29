import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../../../generated/strings.g.dart';
import '../../../../core/config/localization/tk_material_localizations_delegate.dart';
import '../../../../core/config/router/app_router.dart';
import '../../../../sl.dart';

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
  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
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
    );
  }
}
