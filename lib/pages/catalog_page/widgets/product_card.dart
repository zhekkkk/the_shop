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

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final oldPrice = product.oldPrice;
    final picture = product.picture;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageStack(picture: picture),
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
              children: [
                Text(
                  NumberFormat.simpleCurrency(
                          decimalDigits: 2, name: '\u20bd', locale: 'ru')
                      .format(DecimalIntl(product.price)),
                  style: textTheme.bodyMedium
                      ?.copyWith(color: colorTheme.onSurface),
                ),
                if (oldPrice != null)
                  Text(
                    NumberFormat.simpleCurrency(
                            decimalDigits: 2, name: '\u20bd', locale: 'ru')
                        .format(DecimalIntl(oldPrice)),
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
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: colorTheme.onPrimary,
                elevation: 0,
                child: const Icon(
                  Icons.shopping_bag_outlined,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
