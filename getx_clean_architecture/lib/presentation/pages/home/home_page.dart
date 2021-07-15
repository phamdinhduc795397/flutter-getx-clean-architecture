import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/config/app_colors.dart';
import 'package:getx_clean_architecture/presentation/controllers/auth/auth_controller.dart';
import 'package:getx_clean_architecture/presentation/controllers/search_repo/search_repo_binding.dart';
import 'package:getx_clean_architecture/presentation/controllers/search_user/search_user_binding.dart';
import 'package:getx_clean_architecture/presentation/pages/search/search_repo_page.dart';
import 'package:getx_clean_architecture/presentation/pages/search/search_user_page.dart';

enum TabType { home, searchRepo, searchUser, profile }

extension TabItem on TabType {
  Icon get icon {
    switch (this) {
      case TabType.home:
        return Icon(Icons.home, size: 25);
      case TabType.searchRepo:
        return Icon(Icons.search, size: 25);
      case TabType.searchUser:
        return Icon(Icons.verified_user, size: 25);
      case TabType.profile:
        return Icon(Icons.people, size: 25);
    }
  }

  String get title {
    switch (this) {
      case TabType.home:
        return "Home";
      case TabType.searchRepo:
        return "Search Repo";
      case TabType.searchUser:
        return "Search User";
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
            .map((e) => BottomNavigationBarItem(icon: e.icon))
            .toList(),
        inactiveColor: AppColors.lightGray,
        activeColor: AppColors.primary,
      ),
      tabBuilder: (context, index) {
        final type = TabType.values[index];
        switch (type) {
          case TabType.home:
            return Center(
              child: TextButton(
                  onPressed: controller.logout, child: Text("Logout")),
            );
          case TabType.searchRepo:
            SearchRepoBinding().dependencies();
            return SearchRepoPage(
              title: type.title,
            );
          case TabType.searchUser:
            SearchUserBinding().dependencies();
            return SearchUserPage(title: type.title);
          default:
            return Center(
              child: Text(type.title),
            );
        }
      },
    );
  }
}
