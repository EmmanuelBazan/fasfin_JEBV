import 'package:fasfin/app/presentation/pages/pages.dart';
import 'package:fasfin/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.homePageRoute: (_) => const HomeView(),
    Routes.splashPageRoute: (_) => const SplashView(),
    Routes.offlinePageRoute: (_) => const OfflineView(),
    Routes.addRecordPageRoute: (_) => const AddRecordView(),
  };
}
