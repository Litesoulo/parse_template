import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/config/router/app_router.dart';
import '../../../../core/enum/app_open_status.dart';
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
      FlutterNativeSplash.remove();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      // builder: (_) => reaction(
      //   (_) => sl<CategoriesStore>().dataStatus,
      //   (status) {
      //     switch (status) {
      //       case DataStatus.success:
      //         FlushbarHelper.showSuccess(context);
      //         break;
      //       case DataStatus.fail:
      //         FlushbarHelper.showError(context);
      //         break;
      //       default:
      //     }
      //   },
      // ),
      builder: (_) => reaction(
        (_) => _applicationStore.status,
        (status) {
          switch (status) {
            case AppOpenStatus.error:
              context.pushRoute(const ErrorRoute());
              break;
            case AppOpenStatus.firstLaunch:
              context.pushRoute(const OnboardingRoute());
              break;
            // case AppOpenStatus.updateRequired:
            //   context.pushRoute(const UpdateRequiredRoute());
            //   break;
            // case AppOpenStatus.credentialsExpired:
            //   context.pushRoute(const LoginRoute());
            //   break;
            case AppOpenStatus.unauthorized:
              context.pushRoute(const NewsRoute());
              break;
            // case AppOpenStatus.authenticated:
            //   context.pushRoute(const HomeRoute());
            //   break;
            default:
          }
        },
      ),
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
