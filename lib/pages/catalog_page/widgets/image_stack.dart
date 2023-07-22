import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageStack extends StatefulWidget {
  const ImageStack({super.key, this.picture});

  final String? picture;

  @override
  State<ImageStack> createState() => _ImageStackState();
}

class _ImageStackState extends State<ImageStack> {

  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: widget.picture != null ? widget.picture! : 'https://floimages.mncdn.com/media/catalog/product/19-11/01/100528281_1.jpg',
          //'https://p2.trrsf.com/image/fget/cf/1200/1200/middle/images.terra.com/2022/10/20/980551419-reduz-a-pegada-de-carbono-1-e1632168082557.jpg',
          fit: BoxFit.fill,
          progressIndicatorBuilder: (_, __, ___) {
            return const Center(
              child: CircularProgressIndicator()
            );
          },
        ),
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
    );
  }
}
