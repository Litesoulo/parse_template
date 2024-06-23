import 'package:flutter/material.dart';

import '../../../../config/router/app_router.dart';
import '../../../../sl.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: sl<AppRouter>().config(),

      // Disable debug banner
      debugShowCheckedModeBanner: false,
    );
  }
}
