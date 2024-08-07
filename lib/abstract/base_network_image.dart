import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class BaseNetworkImage extends StatelessWidget {
  const BaseNetworkImage({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      imageUrl,
      width: double.infinity,
      fit: BoxFit.cover,
      handleLoadingProgress: true,
    );
  }
}
