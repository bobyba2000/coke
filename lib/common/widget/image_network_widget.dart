import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNetworkWidget extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget Function(BuildContext, String, dynamic)? errorBuilder;
  const ImageNetworkWidget({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.errorBuilder,
    this.fit,
  }) : super(key: key);

  double? get size {
    if (width == null && height == null) {
      return null;
    }
    if (width == null) {
      return height;
    }
    if (height == null) {
      return width;
    }
    return min(width!, height!);
  }

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return SizedBox(
        height: size,
        width: size,
        child: Icon(
          Icons.image_not_supported_outlined,
          size: size,
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit ?? BoxFit.contain,
      height: height,
      width: width,
      progressIndicatorBuilder: (BuildContext context, String url,
          DownloadProgress? loadingProgress) {
        return CircularProgressIndicator(
          value: loadingProgress?.progress,
        );
      },
      errorWidget: errorBuilder ??
          (context, url, err) {
            return SizedBox(
              height: size,
              width: size,
              child: Icon(
                Icons.image_not_supported_outlined,
                size: size,
              ),
            );
          },
    );
  }
}
