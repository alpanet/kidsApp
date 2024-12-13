import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SplashApp extends ConsumerWidget {
  const SplashApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 0.0.sp,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: const AutoRouter(),
    );
  }
}
