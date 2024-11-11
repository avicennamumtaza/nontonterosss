import 'package:flutter/material.dart';
import 'package:nontonterosss/core/configs/assets/app_images.dart';
import 'package:nontonterosss/domain/tv/entities/tv.dart';

import '../../../core/configs/theme/app_colors.dart';

class PopularTvCard extends StatelessWidget {
  final TvEntity tvEntity;
  const PopularTvCard({required this.tvEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //  AppNavigator.push(context, MovieWatchPage(tvEntity: tvEntity,));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        AppImages.movieImageBasePath + tvEntity.posterPath!),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tvEntity.name!,
                      style: const TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber,
                        ),
                        Text(
                          ' ${tvEntity.voteAverage!.toStringAsFixed(1)}',
                          style: const TextStyle(fontSize: 10),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
