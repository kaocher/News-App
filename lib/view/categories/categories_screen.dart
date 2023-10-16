import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/view/details/news_details_screen.dart';
import 'package:news_app/view_model/news_view_model.dart';
import 'package:news_app/widgets/custom_loader.dart';
import '../../widgets/custom_list_item.dart';
import 'widgets/category_list.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final format = DateFormat('yMd');
  NewsViewModel newsViewModel = NewsViewModel();
  String categoryname = "General";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            //-------------Category List-----------
            const CategoryList(),
            const SizedBox(
              height: 10,
            ),
            //----------NewsList by Category----------
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: FutureBuilder(
                  future: newsViewModel.fetchNewsCategories(categoryname),
                  builder: (context, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return const CustomLoader();
                    } else {
                      return ListView.builder(
                          itemCount: snapShot.data!.articles!.length,
                          itemBuilder: (context, index) {
                            DateTime dateTime = DateTime.parse(snapShot
                                .data!.articles![index].publishedAt
                                .toString());
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => NewsDetailsScreen(
                                        item:
                                            snapShot.data!.articles![index])));
                              },
                              child: CustomListItem(
                                imageUrl: snapShot
                                    .data!.articles![index].urlToImage
                                    .toString(),
                                title: snapShot.data!.articles![index].title
                                    .toString(),
                                source: snapShot
                                    .data!.articles![index].source!.name
                                    .toString(),
                                publishedAt: format.format(dateTime),
                              ),
                            );
                          });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
