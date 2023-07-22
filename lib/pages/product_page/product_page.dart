import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_shop/assets/icons/the_shop_icons_icons.dart';
import 'package:the_shop/models/product.dart';

@RoutePage()
class ProductPage extends StatelessWidget {
  const ProductPage({
    super.key,
    required this.product,
    required this.productId,
  });

  final Product product;
  final int productId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final oldPrice = product.oldPrice;
    double? discount;
    if (oldPrice != null) {
      final difference = num.parse(DecimalIntl(product.price).toString()) /
          num.parse(DecimalIntl(oldPrice).toString());
      final d = 1 - difference;
      discount = d * 100;
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          product.brand != null ? 'бренд: ${product.brand}' : 'Страница товара',
          style: textTheme.bodyLarge,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (discount != null)
                    Text(
                      'СКИДКА!  -${NumberFormat.decimalPatternDigits(decimalDigits: 2).format(discount)}%',
                      style: textTheme.bodySmall?.copyWith(fontSize: 18),
                    ),
                  Spacer(),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: true
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_border,
                            color: Color(0xFF7d7d7d)),
                    onPressed: () {},
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    height: 250,
                    width: 250,
                    child: PageView.builder(
                      itemCount: 1,
                      itemBuilder: (_, index) {
                        final picture = product.picture;
                        return CachedNetworkImage(
                          imageUrl: picture,
                          //fit: BoxFit.fitHeight,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  product.name,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headlineMedium
                      ?.copyWith(color: colorTheme.onSurfaceVariant),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    NumberFormat.simpleCurrency(
                            decimalDigits: 2, name: '\u20bd', locale: 'ru')
                        .format(DecimalIntl(product.price)),
                    style: textTheme.headlineSmall
                        ?.copyWith(color: colorTheme.secondary),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  if (oldPrice != null)
                    Text(
                      NumberFormat.simpleCurrency(
                              decimalDigits: 2, name: '\u20bd', locale: 'ru')
                          .format(DecimalIntl(oldPrice)),
                      style: textTheme.headlineSmall?.copyWith(
                        color: colorTheme.onBackground,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                ),
                child: SizedBox(
                  height: 50,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      textStyle: textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: colorTheme.primary),
                      backgroundColor: colorTheme.onPrimary,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'В КОРЗИНУ',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
              ),

              /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.fiber_manual_record,
                    color: index == 0 ? Color(0xFF7d7d7d) : Color(0x807d7d7d),
                    size: 7,
                  ),
                  Icon(
                    Icons.fiber_manual_record,
                    color: index == 1 ? Color(0xFF7d7d7d) : Color(0x807d7d7d),
                    size: 7,
                  ),
                  Icon(
                    Icons.fiber_manual_record,
                    color: index == 2 ? Color(0xFF7d7d7d) : Color(0x807d7d7d),
                    size: 7,
                  ),
                ],
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
