import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:slash/features/wallpapers/view/widgets/shimmer_placeholder.dart';
import 'package:slash/injection_container.dart';

class SlashedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;

  const SlashedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      cacheManager: sl<BaseCacheManager>(),
      placeholder: (context, url) => const ShimmerPlaceHolder(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
