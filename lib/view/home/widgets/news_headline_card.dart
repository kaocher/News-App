import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewsHeadlineCard extends StatelessWidget {
  const NewsHeadlineCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.source,
      required this.publishedAt});
  final String imageUrl;
  final String title;
  final String source;
  final String publishedAt;

  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.sizeOf(context);

    final textTheme = Theme.of(context).textTheme;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: size.height * .6,
          width: size.width * .8,
          margin: const EdgeInsets.only(left: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const SpinKitCircle(
                color: Colors.red,
              ),
              errorWidget: (context, url, error) => const Center(
                  child: Icon(
                Icons.error,
                color: Colors.red,
              )),
            ),
          ),
        ),
        //-------------Headline Card------------
        Positioned(
          bottom: 20,
          left: 15,
          right: 10,
          child: SizedBox(
            height: size.height * .20,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: textTheme.titleLarge),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          source,
                          style: textTheme.bodyMedium!
                              .copyWith(color: Colors.deepOrange),
                        ),
                        Text(publishedAt, style: textTheme.bodySmall),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
