import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_shop/models/product.dart';
import 'package:the_shop/util/price_format.dart';

class ShoppingCartProductCard extends StatelessWidget {
  const ShoppingCartProductCard({
    super.key,
    required this.isFavorites,
    this.onFavoriteTap,
    required this.product,
  });

  final bool isFavorites;
  final VoidCallback? onFavoriteTap;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final oldPrice = product.oldPrice;
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: CachedNetworkImage(
                imageUrl: product.picture,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: textTheme.bodySmall
                            ?.copyWith(color: colorTheme.secondary),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: IconButton(
                                onPressed: onFavoriteTap,
                                icon: isFavorites
                                    ? const Icon(Icons.favorite,
                                        color: Colors.red)
                                    : const Icon(Icons.favorite_border,
                                        color: Color(0xFF7d7d7d)),
                                iconSize: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.clear),
                                iconSize: 25,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            PriceFormat.formatPrice(product.price),
                            style: textTheme.headlineMedium
                                ?.copyWith(color: colorTheme.onPrimary),
                          ),
                          if (oldPrice != null)
                            Text(
                              PriceFormat.formatPrice(oldPrice),
                              style: textTheme.headlineSmall?.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: colorTheme.onSurface,
                              ),
                            ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 34,
                        width: 96,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: colorTheme.onPrimary,
                                  shape: BoxShape.rectangle,
                                  border: Border.all(width: 1),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: colorTheme.primary,
                                ),
                              ),
                            ),
                            Container(
                              height: 34,
                              width: 32,
                              child: Center(child: Text('1')),
                            ),
                            InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: colorTheme.onPrimary,
                                  shape: BoxShape.rectangle,
                                  border: Border.all(width: 1),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: colorTheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
