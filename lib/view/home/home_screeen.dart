import 'package:flutter/material.dart';
import 'package:news_app/model/news_headline_model.dart';
import 'package:news_app/view/categories/categories_screen.dart';
import 'package:news_app/view/details/news_details_screen.dart';
import 'package:news_app/view/home/widgets/news_headline_card.dart';
import 'package:news_app/view_model/news_view_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:news_app/widgets/custom_list_item.dart';
import 'package:news_app/widgets/custom_loader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//----------PopUpMenuItem enum----------
enum NewsSourceList {
  bbcNews,
  aryNews,
  independent,
  reuters,
  foxNews,
  alJazeera,
}

class _HomeScreenState extends State<HomeScreen> {
  //---------------Date Format--------------
  final format = DateFormat('yMd');
  NewsViewModel newsViewModel = NewsViewModel();
  NewsSourceList? selectedMenu;
  String name = "bbc-news";

  @override
  Widget build(BuildContext context) {
    //------------Get Screen Size--------
    final size = MediaQuery.sizeOf(context);

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      //---------------App Bar-----------
      appBar: AppBar(
        title: Text("News", style: textTheme.titleLarge),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CategoriesScreen()));
          },
          icon: const Icon(Icons.menu),
        ),
        //------------Pop-Up Menu--------------
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.light_mode),
          ),
          PopupMenuButton(
            initialValue: selectedMenu,
            onSelected: (NewsSourceList item) {
              if (NewsSourceList.bbcNews.name == item.name) {
                name = "bbc-news";
              }
              if (NewsSourceList.aryNews.name == item.name) {
                name = "ary-news";
              }
              if (NewsSourceList.independent.name == item.name) {
                name = "independent-news";
              }
              if (NewsSourceList.reuters.name == item.name) {
                name = "reuters-news";
              }
              if (NewsSourceList.foxNews.name == item.name) {
                name = "fox-news";
              }
              if (NewsSourceList.alJazeera.name == item.name) {
                name = "al-jazeera-english";
              }

              setState(() {});
            },
            itemBuilder: (context) => <PopupMenuEntry<NewsSourceList>>[
              const PopupMenuItem(
                value: NewsSourceList.bbcNews,
                child: Text("BBC NEWS"),
              ),
              const PopupMenuItem(
                value: NewsSourceList.aryNews,
                child: Text("ARY NEWS"),
              ),
              const PopupMenuItem(
                value: NewsSourceList.independent,
                child: Text("INDEPRNDENT NEWS"),
              ),
              const PopupMenuItem(
                value: NewsSourceList.reuters,
                child: Text("REUTERS NEWS"),
              ),
              const PopupMenuItem(
                value: NewsSourceList.foxNews,
                child: Text("FOX NEWS"),
              ),
              const PopupMenuItem(
                value: NewsSourceList.alJazeera,
                child: Text("ALJAZEERA NEWS"),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          primary: true,
          children: [
            SizedBox(
              height: size.height * 0.6,
              width: size.width,
              //-----------Horizontal NewsList with Headline------------
              child: FutureBuilder<NewsHeadlineModel>(
                future: newsViewModel.fetchNewsHeadline(name),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitChasingDots(
                        color: Colors.red,
                      ),
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context, index) {
                        DateTime dateTime = DateTime.parse(snapshot
                            .data!.articles![index].publishedAt
                            .toString());
                        return InkWell(
                          onTap: () {},
                          child: NewsHeadlineCard(
                            imageUrl: snapshot.data!.articles![index].urlToImage
                                .toString(),
                            title: snapshot.data!.articles![index].title
                                .toString(),
                            source: snapshot.data!.articles![index].source!.name
                                .toString(),
                            publishedAt: format.format(dateTime),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            //-----------------Vertical List------------------
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: FutureBuilder(
                future: newsViewModel.fetchNewsCategories("all"),
                builder: (context, snapShot) {
                  if (snapShot.connectionState == ConnectionState.waiting) {
                    return const CustomLoader();
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapShot.data!.articles!.length,
                      itemBuilder: (context, index) {
                        //----------Format DateTime-----------
                        DateTime dateTime = DateTime.parse(snapShot
                            .data!.articles![index].publishedAt
                            .toString());
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NewsDetailsScreen(
                                    item: snapShot.data!.articles![index])));
                          },
                          child: CustomListItem(
                            imageUrl: snapShot.data!.articles![index].urlToImage
                                .toString(),
                            title: snapShot.data!.articles![index].title
                                .toString(),
                            source: snapShot.data!.articles![index].source!.name
                                .toString(),
                            publishedAt: format.format(dateTime),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
