import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/types/category_type.dart';
import 'package:getx_clean_architecture/presentation/controllers/news/news_controller.dart';
import 'package:getx_clean_architecture/presentation/pages/detail/detail_page.dart';
import 'package:getx_clean_architecture/presentation/pages/headline/views/article_cell.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPagePage createState() => _NewsPagePage();
}

class _NewsPagePage extends State<NewsPage> {
  final NewsController newsController = Get.find();
  final _scrollController = ScrollController();
  CategoryType _currentCategory = CategoryType.bitcoin;

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: newsController,
      didUpdateWidget: (old, newState) {
        _scrollController.addListener(_scrollListener);
      },
      dispose: (state) {
        _scrollController.removeListener(_scrollListener);
      },
      builder: (_) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: const Text('News'),
            trailing: TextButton(
                onPressed: () {
                  _selectCategory(context);
                },
                child: Text(_currentCategory.keyword.capitalizeFirst ?? "")),
          ),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: newsController.articles.length,
            itemBuilder: (context, index) {
              final article = newsController.articles[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => DetailPage(article: article));
                },
                child: ArticleCell(article: article),
              );
            },
          ),
        );
      },
    );
  }

  _selectCategory(BuildContext context) {
    final actions = CategoryType.values
        .map(
          (e) => CupertinoActionSheetAction(
            child: Text(e.keyword.capitalizeFirst ?? ""),
            onPressed: () {
              setState(() {
                _currentCategory = e;
              });
              newsController.fetchData(e.keyword);
              Navigator.pop(context);
            },
          ),
        )
        .toList();

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Select category'),
        actions: actions,
      ),
    );
  }

  _scrollListener() {
    if (_scrollController.position.extentAfter < 500) {
      newsController.loadMore(_currentCategory.keyword);
    }
  }
}
