import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shimmer/shimmer.dart';

class AppCatchImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Alignment? alignment;

  const AppCatchImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.alignment,
  });

  static final customCacheManager = CacheManager(
    Config(
      'pokemon_img_catch',
      stalePeriod: const Duration(days: 2),
      maxNrOfCacheObjects: 50,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment ?? Alignment.center,
      cacheManager: customCacheManager,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: height ?? 50,
          width: width ?? 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
