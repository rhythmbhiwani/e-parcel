import 'package:flutter/material.dart';

import 'components/about.dart';
import 'components/book.dart';
import 'components/settings.dart';
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

  static Widget settingsWidget() {
    return Settings();
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
