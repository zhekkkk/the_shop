import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<String> pictures = [
    'https://floimages.mncdn.com/media/catalog/product/19-11/01/100528281_1.jpg',
    'https://www.cdiscount.com/pdt2/9/4/8/1/700x700/mp40972948/rw/crocs-crocband-turquoise-oyster.jpg',
    'https://www.tradeinn.com/f/13709/137092142_5/crocs-crocband-glitter-clogs.jpg',
  ];

  bool checked = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Страница товара',
          style: theme.textTheme.bodyLarge,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text('-44%', style: theme.textTheme.bodySmall?.copyWith(fontSize: 18)),
                  Spacer(),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: checked
                        ? const Icon(Icons.favorite,
                        color: Colors.red)
                        : const Icon(Icons.favorite_border,
                        color: Color(0xFF7d7d7d)),
                    onPressed: () {
                      setState(() {
                        checked = !checked;
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 250,
                  width: 250,
                  child: PageView.builder(
                    itemCount: pictures.length,
                    itemBuilder: (_, index) {
                      final picture = pictures[index];
                      return CachedNetworkImage(
                        imageUrl: picture,
                        //fit: BoxFit.fitHeight,
                      );
                    },
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Название товара Название товара Название товара Название товара Название товара Название товара ',
                  style: theme.textTheme.bodyLarge?.copyWith(fontSize: 20),
                ),
              )
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
