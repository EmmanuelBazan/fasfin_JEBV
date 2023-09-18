import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fasfin/app/data/repositoriesImplementation/connectivity_repository_impl.dart';
import 'package:fasfin/app/data/services/remote/internet_checker.dart';
import 'package:fasfin/app/domain/repositories/connectivity_repository.dart';
import 'package:fasfin/app/presentation/routes/routes.dart';
import 'package:fasfin/app/stateManager/provider.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<ConnectivityRepository>(
      create: () => ConnectivityRepositoryImpl(
        Connectivity(),
        InternetChecker(),
      ),
      child: const _MyView(),
    );
  }
}

class _MyView extends StatefulWidget {
  const _MyView();

  @override
  State<_MyView> createState() => _MyViewState();
}

class _MyViewState extends State<_MyView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _init();
      },
    );
    _init();
  }

  Future<void> _init() async {
    final connectivityRepository = Provider.of<ConnectivityRepository>(context);
    final hasInternet = await connectivityRepository.checkInternetConnection;
    if (hasInternet) {
      _goTo(Routes.homePageRoute);
    } else {
      _goTo(Routes.offlinePageRoute);
    }
  }

  void _goTo(String route) {
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('SplashView'),
      ),
    );
  }
}
