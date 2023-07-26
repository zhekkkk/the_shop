import 'package:cached_network_image/cached_network_image.dart';
import 'package:decimal/intl.dart';
import 'package:decimal/intl.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_shop/assets/icons/the_shop_icons_icons.dart';
import 'package:the_shop/models/product.dart';
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:the_shop/pages/catalog_page/widgets/image_stack.dart';
import 'package:the_shop/util/price_format.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.isFavorites,
    this.onFavoriteTap,
    this.onCartTap,
    required this.isInCart,
  });

  final Product product;
  final bool isFavorites;
  final bool isInCart;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onCartTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final oldPrice = product.oldPrice;
    final picture = product.picture;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageStack(
            onFavoriteTap: onFavoriteTap,
            isFavorites: isFavorites,
            picture: picture,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              product.name,
              style: textTheme.bodySmall?.copyWith(color: colorTheme.secondary),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    PriceFormat.formatPrice(product.price),
                    style: textTheme.bodyMedium
                        ?.copyWith(color: colorTheme.onSurface),
                  ),
                  if (oldPrice != null)
                    Text(
                      PriceFormat.formatPrice(oldPrice),
                      style: textTheme.bodySmall?.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: colorTheme.onSurface,
                      ),
                    ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: 48,
                width: 48,
                child: !isInCart
                    ? FloatingActionButton(
                        onPressed: onCartTap,
                        backgroundColor: colorTheme.onPrimary,
                        elevation: 0,
                        child: const Icon(
                          TheShopIcons.shopping_cart_tab_icon,
                        ),
                      )
                    : FloatingActionButton(
                        onPressed: onCartTap,
                        backgroundColor: colorTheme.primary,
                        elevation: 2,
                        child: Icon(
                          Icons.leave_bags_at_home,
                          color: colorTheme.onPrimary,
                        ),
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
