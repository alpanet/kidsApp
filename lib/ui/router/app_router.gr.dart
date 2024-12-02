// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:kids_app/ui/apps/main_screen.dart' as _i1;
import 'package:kids_app/ui/apps/splash_app.dart' as _i4;
import 'package:kids_app/ui/screens/onboarding/onboardingScreen.dart' as _i2;
import 'package:kids_app/ui/screens/register/register_gathering.dart' as _i3;

/// generated route for
/// [_i1.MainScreen]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.MainScreen();
    },
  );
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingRoute extends _i5.PageRouteInfo<void> {
  const OnboardingRoute({List<_i5.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i3.RegisterGathering]
class RegisterGathering extends _i5.PageRouteInfo<void> {
  const RegisterGathering({List<_i5.PageRouteInfo>? children})
      : super(
          RegisterGathering.name,
          initialChildren: children,
        );

  static const String name = 'RegisterGathering';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.RegisterGathering();
    },
  );
}

/// generated route for
/// [_i4.SplashApp]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashApp();
    },
  );
}
