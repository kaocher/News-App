import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:news_app/model/news_categories_model.dart';

import '../../constant/app_images.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Articles item;
  const NewsDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
     
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;
    final format = DateFormat('MMMM dd, yyyy');
    DateTime dateTime = DateTime.parse(item.publishedAt.toString());

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          height: size.height * 1,
          width: size.width * 1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  width: size.width * 1,
                  child: CachedNetworkImage(
                    imageUrl: item.urlToImage.toString(),
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const SpinKitCircle(
                      color: Colors.red,
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Image.asset(
                        AppImages.errorImage,
                        fit: BoxFit.cover,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title.toString(),
                        style: textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.source!.name.toString(),
                            style: textTheme.bodyMedium,
                          ),
                          Text(
                            //item.publishedAt.toString(),
                            format.format(dateTime),
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        item.description.toString(),
                        style: textTheme.displayMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
