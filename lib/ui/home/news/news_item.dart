import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';
import '../../../model/NewsResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsItem extends StatelessWidget {
  NewsItem({super.key, required this.news});
  News news;
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var screenHeight=852;
    var screenWidth=393;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width*(8/screenWidth),
          vertical:height*(8/screenHeight) ),
      margin:EdgeInsets.only(top: height*(16/screenHeight),
          left: width*(16/screenWidth),right: width*(16/screenWidth)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: Theme.of(context).indicatorColor, width: 2),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              width: double.infinity,
              imageUrl: news.urlToImage??"",
              placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),

            )
            // Image.network(news.urlToImage ?? ""),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              // textAlign: TextAlign.center,
              news.title ?? "",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "By : ${news.author}",
                  style: AppStyles.medium12Grey,
                ),
              ),
              Text(
                "${DateTime.parse(news.publishedAt!).minute.toString()} minutes ago",
                style: AppStyles.medium12Grey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
