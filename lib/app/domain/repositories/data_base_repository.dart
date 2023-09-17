import 'package:fasfin/app/domain/models/record.dart';
import 'package:fasfin/app/stateManager/notifier.dart';

abstract class DataBaseRepository extends Notifier {
  Future<RecordModel> get create;
  Future<RecordModel> get update;
  Future<bool> get delete;
  Future<RecordModel> get find;
  Future<List<RecordModel>> get list;
}
