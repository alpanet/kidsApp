import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kids_app/ui/router/app_router.dart';

class RouterApp extends ConsumerStatefulWidget {
  const RouterApp({Key? key}) : super(key: key);

  @override
  ConsumerState<RouterApp> createState() => _RouterAppState();
}

class _RouterAppState extends ConsumerState<RouterApp> {
  late final AppRouter _appRouter;
  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter();

    // print(fcmToken);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
