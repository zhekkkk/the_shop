import 'package:auto_route/auto_route.dart';
import 'package:the_shop/models/product.dart';
import 'package:the_shop/pages/catalog_page/catalog_page.dart';
import 'package:the_shop/pages/showcase_page/showcase_page.dart';
import 'package:the_shop/pages/favorites_page/favorites_page.dart';
import 'package:the_shop/pages/shopping_cart_page/shopping_cart_page.dart';
import 'package:the_shop/pages/product_page/product_page.dart';
import 'package:the_shop/pages/profile_page/profile_page.dart';
import 'package:the_shop/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes =>
      [
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
          children: [
            AutoRoute(
              page: ShowcaseTab.page,
              children: [
                AutoRoute(
                  initial: true,
                  page: ShowcaseRoute.page,
                ),
              ],
            ),
            AutoRoute(
              initial: true,
              page: CatalogTab.page,
              children: [
                AutoRoute(
                  initial: true,
                  page: CatalogRoute.page,
                ),
                AutoRoute(
                  page: ProductRoute.page,
                ),
              ],
            ),
            AutoRoute(
              page: ShoppingCartTab.page,
              children: [
                AutoRoute(
                  initial: true,
                  page: ShoppingCartRoute.page,
                ),
              ],
            ),
            AutoRoute(
              page: FavoritesTab.page,
              children: [
                AutoRoute(
                  initial: true,
                  page: FavoritesRoute.page,
                ),
              ],
            ),
            AutoRoute(
              page: ProfileTab.page,
              children: [
                AutoRoute(
                  initial: true,
                  page: ProfileRoute.page,
                ),
              ],
            ),
          ],
        )
      ];
}

@RoutePage(name: 'ShowcaseTab')
class ShowcaseTabPage extends AutoRouter {
  const ShowcaseTabPage({super.key});
}

@RoutePage(name: 'CatalogTab')
class CatalogTabPage extends AutoRouter {
  const CatalogTabPage({super.key});
}

@RoutePage(name: 'ShoppingCartTab')
class ShoppingCartTabPage extends AutoRouter {
  const ShoppingCartTabPage({super.key});
}

@RoutePage(name: 'FavoritesTab')
class FavoritesTabPage extends AutoRouter {
  const FavoritesTabPage({super.key});
}

@RoutePage(name: 'ProfileTab')
class ProfileTabPage extends AutoRouter {
  const ProfileTabPage({super.key});
}

