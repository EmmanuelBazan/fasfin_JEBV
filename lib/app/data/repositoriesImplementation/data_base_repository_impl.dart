import 'package:fasfin/app/data/services/local/sql_lite_db.dart';
import 'package:fasfin/app/domain/models/record_model.dart';
import 'package:fasfin/app/domain/repositories/data_base_repository.dart';

class DataBaseRepositoryImpl extends DataBaseRepository {
  final SqlLiteDB database;

  DataBaseRepositoryImpl(this.database);

  @override
  Future<RecordModel?> create(RecordModel record) async {
    final db = await database.getDB;
    final res = await db.insert('Records', record.toMap());
    record.id = res;
    return record;
  }

  @override
  // TODO: implement delete
  Future<bool> get delete => throw UnimplementedError();

  @override
  // TODO: implement find
  Future<RecordModel> get find => throw UnimplementedError();

  @override
  // TODO: implement list
  Future<List<RecordModel>> get list => throw UnimplementedError();

  @override
  // TODO: implement update
  Future<RecordModel> get update => throw UnimplementedError();
}
