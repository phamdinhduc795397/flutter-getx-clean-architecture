import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/config/app_colors.dart';
import 'package:getx_clean_architecture/presentation/controllers/auth/auth_controller.dart';
import 'package:getx_clean_architecture/presentation/controllers/headline/headline_binding.dart';
import 'package:getx_clean_architecture/presentation/controllers/news/news_binding.dart';
import 'package:getx_clean_architecture/presentation/pages/headline/headline_page.dart';
import 'package:getx_clean_architecture/presentation/pages/news/news_page.dart';
import 'package:getx_clean_architecture/presentation/pages/profile/profile_page.dart';

enum TabType { headline, news, profile }

extension TabItem on TabType {
  Icon get icon {
    switch (this) {
      case TabType.headline:
        return Icon(CupertinoIcons.home, size: 25);
      case TabType.news:
        return Icon(CupertinoIcons.news, size: 25);
      case TabType.profile:
        return Icon(CupertinoIcons.person, size: 25);
    }
  }

  String get title {
    switch (this) {
      case TabType.headline:
        return "Headline";
      case TabType.news:
        return "News";
      case TabType.profile:
        return "Profile";
    }
  }
}

class HomePage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: TabType.values
            .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.title))
            .toList(),
        inactiveColor: AppColors.lightGray,
        activeColor: AppColors.primary,
      ),
      tabBuilder: (context, index) {
        final type = TabType.values[index];
        switch (type) {
          case TabType.headline:
            HeadlineBinding().dependencies();
            return HeadlinePage();
          case TabType.news:
            NewsBinding().dependencies();
            return NewsPage();
          case TabType.profile:
            return ProfilePage();
        }
      },
    );
  }
}
