import 'package:fasfin/app/domain/models/record_model.dart';
import 'package:fasfin/app/domain/repositories/data_base_repository.dart';
import 'package:fasfin/app/stateManager/notifier.dart';

class HomeController extends Notifier {
  final DataBaseRepository db;

  List<RecordModel> _recordList = [];

  List<RecordModel> get recordList => _recordList;

  HomeController(this.db) {
    getAllExpenses();
  }

  Future<void> getAllExpenses() async {
    final res = await db.listByOperation(1);
    _recordList = [...res];
    notify();
  }
}
