import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/wallpapers/controller/wallpapers_bloc/wallpapers_bloc.dart';
import 'package:slash/features/wallpapers/view/widgets/wallpapers_page_content.dart';
import 'package:slash/injection_container.dart';

@RoutePage()
class WallpapersPage extends StatefulWidget {
  const WallpapersPage({super.key});

  @override
  State<WallpapersPage> createState() => _WallpapersPageState();
}

class _WallpapersPageState extends State<WallpapersPage> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
    sl<WallpapersBloc>().add(FetchNextWallpapers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("/ slash"),
      ),
      body: BlocBuilder<WallpapersBloc, WallpapersState>(
        builder: (context, state) {
          return WallpapersPageContent(
            state: state,
            scrollController: scrollController,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(onScroll)
      ..dispose();
    super.dispose();
  }

  void onScroll() {
    if (isBottom) context.read<WallpapersBloc>().add(FetchNextWallpapers());
  }

  bool get isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;

    return currentScroll >= (maxScroll * 0.9);
  }
}
