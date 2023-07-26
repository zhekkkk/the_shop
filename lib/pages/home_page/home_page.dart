import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_shop/assets/icons/the_shop_icons_icons.dart';
import 'package:the_shop/navigation/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorScheme;
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
          type: BottomNavigationBarType.fixed,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          unselectedItemColor: colorTheme.outline,
          selectedItemColor: colorTheme.secondary,
          unselectedFontSize: 10,
          selectedFontSize: 10,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                TheShopIcons.showcase_tab_icon,
                size: 35,
              ),
              label: 'Витрина',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                TheShopIcons.catalog_tab_icon,
                size: 35,
              ),
              label: 'Каталог',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                TheShopIcons.shopping_cart_tab_icon,
                size: 35,
              ),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                TheShopIcons.favorites_tab_icon,
                size: 35,
              ),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                TheShopIcons.profile_tab_icon,
                size: 35,
              ),
              label: 'Профиль',
            ),
          ],
        );
      },
    );
  }
}
