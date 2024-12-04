import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page|App,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: MainRoute.page),
    AutoRoute(page: SplashRoute.page, initial: true, children: [
      AutoRoute(page: OnboardingRoute.page, initial: true),
      AutoRoute(page: RegisterGathering.page, path: "register"),
      AutoRoute(page: RegisterOtp.page, path: "registerOtp"),
      AutoRoute(page: MainPage.page, path: "mainpage")
    ]),
  ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
