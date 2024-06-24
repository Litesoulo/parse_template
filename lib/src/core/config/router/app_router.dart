import 'package:auto_route/auto_route.dart';
import '../../../presentation/screen/screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: SplashRoute.page,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: ErrorRoute.page,
        ),
        AutoRoute(
          page: OnboardingRoute.page,
        ),
        AutoRoute(
          page: UpdateRequiredRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
      ];
}
