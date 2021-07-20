import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/presentation/controllers/headline/headline_controller.dart';
import 'package:getx_clean_architecture/presentation/pages/detail/detail_page.dart';
import 'package:getx_clean_architecture/presentation/pages/headline/views/article_cell.dart';

class HeadlinePage extends GetView<HeadlineController> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      initState: (state) {
        controller.fetchData();
      },
      didUpdateWidget: (old, newState) {
        _scrollController.addListener(_scrollListener);
      },
      dispose: (state) {
        _scrollController.removeListener(_scrollListener);
      },
      builder: (_) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Headline'),
          ),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: controller.articles.length,
            itemBuilder: (context, index) {
              final article = controller.articles[index];
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

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 500) {
      print("load more");
      controller.loadMore();
    }
  }
}
