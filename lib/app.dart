import 'package:flutter/material.dart';

import 'injection_container.dart';
import 'router/app_router.dart';

class App extends StatelessWidget {
  final appRouter = sl<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
    );
  }
}
