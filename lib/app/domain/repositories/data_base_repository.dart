import 'package:fasfin/app/domain/models/record_model.dart';
import 'package:fasfin/app/stateManager/notifier.dart';

abstract class DataBaseRepository extends Notifier {
  Future<RecordModel?> create(RecordModel record);
  Future<RecordModel> get update;
  Future<bool> get delete;
  Future<RecordModel> get find;
  Future<List<RecordModel>> get list;
}
