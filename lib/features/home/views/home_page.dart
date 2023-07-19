import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:slash/router/app_router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        WallpapersRoute(),
        LikedWallpapersRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Wallpapers",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Likes",
            ),
          ],
        );
      },
    );
  }
}
