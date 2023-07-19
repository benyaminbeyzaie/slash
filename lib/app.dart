import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/wallpapers/controller/wallpapers_bloc/wallpapers_bloc.dart';

import 'injection_container.dart';
import 'router/app_router.dart';

class App extends StatelessWidget {
  final appRouter = sl<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: MaterialApp.router(
        theme: ThemeData(
          useMaterial3: true,
        ),
        routerConfig: appRouter.config(),
      ),
    );
  }

  final List<BlocProvider> providers = [
    BlocProvider<WallpapersBloc>(
      create: (BuildContext context) => sl<WallpapersBloc>(),
    ),
  ];
}
