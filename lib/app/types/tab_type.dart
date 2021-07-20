import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
