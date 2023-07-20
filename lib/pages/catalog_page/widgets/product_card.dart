import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_shop/pages/catalog_page/widgets/image_stack.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Column(
      children: [
        const ImageStack(),
        SizedBox(
          height: 32,
          child: Text(
            'Название товара Название товара Название товара',
            style: textTheme.bodySmall?.copyWith(color: colorTheme.secondary),
            //overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          children: [
            Column(
              children: [
                Text(
                  '1990 ₽',
                  style: textTheme.bodyMedium
                      ?.copyWith(color: colorTheme.onSurface),
                ),
                Text(
                  '2990 ₽',
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
