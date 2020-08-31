import 'package:flutter/material.dart';

import 'components/about.dart';
import 'components/book.dart';
import 'components/dashboard.dart';
import 'components/help.dart';
import 'components/history.dart';

class GetWidgets {
  // static GlobalKey bottomNavigationKey = GlobalKey();
  static Widget dashboardWidget() {
    return Dashboard();
  }

  static Widget aboutWidget() {
    return About();
  }

  static Widget bookWidget() {
    return Book();
  }

  static Widget helpWidget() {
    return Help();
  }

  static Widget historyWidget() {
    return History();
  }
}
