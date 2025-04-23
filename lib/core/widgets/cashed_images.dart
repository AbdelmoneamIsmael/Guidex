import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/widgets/loading.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.url,
    this.errorWidget,
    this.fit,
    this.height,
    this.width,
  });
  final String url;
  final Widget? errorWidget;
  final BoxFit? fit;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
      imageUrl: "${url.contains("http") ? "" : baseUrl}$url",
      placeholder: (context, url) {
        return CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
          strokeWidth: .5,
        );
      },
      errorWidget: (context, url, error) =>
          errorWidget ?? const Icon(Icons.error),
    );
  }
}
