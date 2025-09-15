import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../theming/colors.dart';
import '../utils/assets.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  final String imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final customCacheManager = CacheManager(
      Config(
        'customCacheKey',
        stalePeriod: const Duration(days: 15),
        maxNrOfCacheObjects: 50,
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: CachedNetworkImage(
        cacheManager: customCacheManager,
        key: UniqueKey(),
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: BoxFit.fill,
        errorWidget:
            (context, url, error) => Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(color: ColorsManager.black),
              child: Image.asset(Assets.logo, width: width, height: height),
            ),
        placeholder:
            (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(color: ColorsManager.black),
              ),
            ),
      ),
    );
  }
}
