import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:the_shop/app_state.dart';
import 'package:the_shop/data/service/catalog_service.dart';
import 'package:the_shop/models/product.dart';
import 'package:the_shop/pages/favorites_page/favorites.dart';
import 'package:the_shop/pages/shopping_cart_page/widgets/shopping_cart_product_card.dart';

import '../../navigation/app_router.dart';

@RoutePage()
class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  CatalogService get catalogService => context.read();

  Future<List<Product>> _loadProducts(List<int> productIds) async {
    List<Product> result = [];
    for (int i = 0; i < productIds.length; i++) {
      result.add(await catalogService.getProduct(productId: productIds[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorTheme.primary,
        elevation: 0,
        title: Text(
          'Корзина',
          style: textTheme.bodyLarge,
        ),
      ),
      body: SafeArea(
        child: StoreConnector<AppState, AppState>(
          builder: (context, state) {
            return FutureBuilder(
              future: _loadProducts(state.shoppingCartIds.toList()),
              builder: (context, snapshot) {
                final products = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.none) {
                  return const Center(
                    child: Text(
                      'ошибка при загрузке товаров',
                    ),
                  );
                }
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: products!.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return StoreConnector<AppState, bool>(
                      builder: (context, isFavorites) {
                        return StoreConnector<AppState, VoidCallback>(
                          builder: (context, callback) {
                            return GestureDetector(
                              child: ShoppingCartProductCard(
                                onFavoriteTap: callback,
                                isFavorites: isFavorites,
                                product: product,
                              ),
                            );
                          },
                          converter: (store) => () {
                            final favorite = store.state.favoritesIds.contains(product.id);
                            if (favorite) {
                              store.dispatch(RemoveFromFavorites(product.id));
                            } else {
                              store.dispatch(AddToFavoritesAction(product.id));
                            }
                          },
                        );
                      },
                      converter: (store) =>
                          store.state.favoritesIds.contains(product.id),
                    );
                  },
                );
              },
            );
          },
          converter: (store) => store.state,
        ),
      ),
    );
  }
}
