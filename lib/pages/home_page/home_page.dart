import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:the_shop/navigation/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      lazyLoad: false,
      routes: const [
        ShowcaseTab(),
        CatalogTab(),
        ShoppingCartTab(),
        FavoritesTab(),
        ProfileTab(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          unselectedItemColor: const Color(0xFFB8B8B8),
          selectedItemColor: const Color(0xFF1f1f1f),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: 'Витрина',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_search_sharp),
              label: 'Каталог',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Профиль',
            ),
          ],
        );
      },
    );
  }
}
