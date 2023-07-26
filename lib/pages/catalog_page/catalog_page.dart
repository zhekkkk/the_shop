import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:the_shop/app_state.dart';
import 'package:the_shop/data/service/catalog_service.dart';
import 'package:the_shop/models/product.dart';
import 'package:the_shop/navigation/app_router.dart';
import 'package:the_shop/pages/catalog_page/widgets/product_card.dart';
import 'package:the_shop/pages/catalog_page/widgets/search_field.dart';
import 'package:the_shop/pages/favorites_page/favorites.dart';

@RoutePage()
class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  CatalogService get catalogService => context.read();

  Future<List<Product>> _loadProducts() async {
    final response = await catalogService.postProducts();
    return response.results;
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
          'Каталог товаров',
          style: textTheme.bodyLarge,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SearchField(),
            FutureBuilder(
              future: _loadProducts(),
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
                return Expanded(
                  child: GridView.builder(
                    itemCount: products!.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
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
                                          product: product,
                                          onCartTap: cartCallback,
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
            ),
          ],
        ),
      ),
    );
  }
}



