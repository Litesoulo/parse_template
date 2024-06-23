import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'store/application_store.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _applicationStore = ApplicationStore();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _applicationStore.init();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
