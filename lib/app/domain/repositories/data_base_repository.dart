import 'package:fasfin/app/domain/models/record_model.dart';

abstract class DataBaseRepository {
  Future<RecordModel?> create(RecordModel record);
  Future<RecordModel> get update;
  Future<bool> get delete;
  Future<RecordModel> get find;
  Future<List<RecordModel>> get list;
  Future<List<RecordModel>> listByOperation(int operation);
}
