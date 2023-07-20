import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_shop/navigation/app_router.dart';
import 'package:the_shop/pages/catalog_page/widgets/product_card.dart';
import 'package:the_shop/pages/catalog_page/widgets/search_field.dart';

@RoutePage()
class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
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
            Expanded(
              child: GridView.builder(
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 164 / 250,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: GestureDetector(
                      onTap: () async {
                        context.router.push(
                          const ProductRoute()
                        );
                      },
                      child: const ProductCard(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
