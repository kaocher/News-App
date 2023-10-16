import 'package:flutter/material.dart';
import 'package:news_app/model/news_categories_model.dart';
import 'package:news_app/view/home/home_screeen.dart';
import 'package:news_app/view_model/news_view_model.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    
    NewsViewModel newsViewModel = NewsViewModel();
    String categoryname = "general";
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              icon: const Icon(Icons.arrow_back))
        ],
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding:  const EdgeInsets.all(8.0),
         child: FutureBuilder<NewsCategoriesModel>(future: newsViewModel.fetchNewsCategories(categoryname),
          builder: (context,snapshot){
            return Text(snapshot.data!.articles!.toString());
          })
        ),)
    );
}}             