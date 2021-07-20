import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_clean_architecture/app/config/app_text_styles.dart';
import 'package:jiffy/jiffy.dart';
import 'package:getx_clean_architecture/domain/entities/article.dart';

class ArticleCell extends StatelessWidget {
  final Article article;
  ArticleCell({required this.article});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 100,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: CachedNetworkImage(
              width: 120,
              memCacheHeight: 150,
              memCacheWidth: 150,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey,
              ),
              imageUrl: article.urlToImage ?? "",
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title ?? "",
                  maxLines: 2,
                  style: AppTextStyles.title,
                ),
                Spacer(),
                Text(
                  article.author ?? "",
                  maxLines: 1,
                  style: AppTextStyles.body,
                ),
                Text(
                  Jiffy(article.publishedAt).yMMMMd,
                  maxLines: 1,
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
