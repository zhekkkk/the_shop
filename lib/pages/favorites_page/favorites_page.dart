import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_shop/app_state.dart';
import 'package:the_shop/models/product.dart';
import 'package:the_shop/data/service/catalog_service.dart';
import 'package:provider/provider.dart';
import 'package:the_shop/navigation/app_router.dart';
import 'package:the_shop/pages/catalog_page/widgets/product_card.dart';
import 'package:the_shop/pages/favorites_page/favorites.dart';


@RoutePage()
class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  CatalogService get catalogService => context.read();

  Future<List<Product>> _loadProducts(List<int> productIds) async {
    List<Product> result =[];
    for(int i = 0; i < productIds.length; i++) {
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
          'Любимое',
          style: textTheme.bodyLarge,
        ),
      ),
      body: SafeArea(
        child: StoreConnector<AppState, AppState>(
          builder: (context, state) {
            return FutureBuilder(
              future: _loadProducts(state.favoritesIds.toList()),
              builder: (context, snapshot) {
                final products = snapshot.data;
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(snapshot.connectionState == ConnectionState.none) {
                  return const Center(
                    child: Text(
                      'ошибка при загрузке товаров',
                    ),
                  );
                }
                return Expanded(
                  child: GridView.builder(
                    itemCount: products!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 164 / 250,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return StoreConnector<AppState, bool>(
                        builder: (context, isFavorites) {
                          return StoreConnector<AppState, bool>(
                            builder: (context, isInCart) {
                              return StoreConnector<AppState, VoidCallback>(
                                builder: (context, callback) {
                                  return StoreConnector<AppState, VoidCallback>(
                                    builder: (context, cartCallback) {
                                      return GestureDetector(
                                        onTap: () {
                                          context.router.push(ProductRoute(
                                            product: product,
                                            productId: product.id,
                                            onCartTap: cartCallback,
                                            onFavoriteTap: callback,
                                            isInCart: isInCart,
                                            isFavorites: isFavorites,
                                          ));
                                        },
                                        child: ProductCard(
                                          onFavoriteTap: callback,
                                          isInCart: isInCart,
                                          isFavorites: isFavorites,
                                          onCartTap: cartCallback,
                                          product: product,
                                        ),
                                      );
                                    },
                                    converter: (store) => () {
                                      final inCart = store.state.shoppingCartIds.contains(product.id);
                                      if (inCart) {
                                        store.dispatch(RemoveFromCartAction(product.id));
                                      } else {
                                        store.dispatch(AddToCartAction(product.id));
                                      }
                                    },
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
                            converter: (store) => store.state.shoppingCartIds.contains(product.id),
                          );
                        },
                        converter: (store) => store.state.favoritesIds.contains(product.id),
                      );
                    },
                  ),
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
