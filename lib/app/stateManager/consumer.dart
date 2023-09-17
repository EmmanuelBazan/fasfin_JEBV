import 'package:fasfin/app/stateManager/notifier.dart';
import 'package:fasfin/app/stateManager/provider.dart';
import 'package:flutter/material.dart';

class Consumer<T extends Notifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T notifier) builder;

  const Consumer({
    super.key,
    required this.builder,
  });

  @override
  State<Consumer<T>> createState() => _ConsumerState<T>();
}

class _ConsumerState<T extends Notifier> extends State<Consumer<T>> {
  late final T _notifier;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _notifier = Provider.of(context);
      _notifier.addListener(_listener);
      _initialized = true;
    }
  }

  @override
  void dispose() {
    _notifier.removeListener(_listener);
    super.dispose();
  }

  void _listener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _notifier);
  }
}
