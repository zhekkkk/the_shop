import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageStack extends StatelessWidget {
  const ImageStack({
    super.key,
    this.picture,
    required this.isFavorites,
    this.onFavoriteTap,
  });

  final String? picture;
  final bool isFavorites;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: picture != null
              ? picture!
              : 'https://floimages.mncdn.com/media/catalog/product/19-11/01/100528281_1.jpg',
          fit: BoxFit.fill,
          progressIndicatorBuilder: (_, __, ___) {
            return const Center(child: CircularProgressIndicator());
          },
        ),
        IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: isFavorites
              ? const Icon(Icons.favorite, color: Colors.red)
              : const Icon(Icons.favorite_border, color: Color(0xFF7d7d7d)),
          onPressed: onFavoriteTap,
        ),
      ],
    );
  }
}
