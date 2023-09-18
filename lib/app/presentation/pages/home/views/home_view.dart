import 'package:fasfin/app/data/repositoriesImplementation/data_base_repository_impl.dart';
import 'package:fasfin/app/data/services/local/sql_lite_db.dart';
import 'package:fasfin/app/presentation/pages/home/views/home_controller.dart';
import 'package:fasfin/app/stateManager/consumer.dart';
import 'package:fasfin/app/stateManager/provider.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<HomeController>(
      create: () => HomeController(
        DataBaseRepositoryImpl(
          SqlLiteDB(),
        ),
      ),
      child: const _MyView(),
    );
  }
}

class _MyView extends StatelessWidget {
  const _MyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<HomeController>(
          builder: (context, controller) =>
              Text('HomeView ${controller.recordList.length}'),
        ),
      ),
    );
  }
}
