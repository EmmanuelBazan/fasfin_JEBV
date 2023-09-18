import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlLiteDB {
  static Database? _database;

  Future<Database> get getDB async {
    if (_database != null) return _database!;

    _database = await _initDB();

    return _database!;
  }

  Future<Database> _initDB() async {
    //^ path where the database will be stored
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'Fasfin.db');

    //^ Create database
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Cuentas(
            id INTEGER PRIMARY KEY,
            nombre TEXT,
            descripcion TEXT,
            total REAL,
            icono TEXT,
            color TEXT,
          )
        ''');

        await db.execute('''
          CREATE TABLE Operaciones(
            id INTEGER PRIMARY KEY,
            descripcion TEXT,
          )
        ''');

        await db.execute('''
          CREATE TABLE Categorias(
            id INTEGER PRIMARY KEY,
            nombre TEXT,
            color TEXT,
            icono TEXT,
            operacionId INT,
            FOREIGN KEY (operacionId) REFERENCES Operaciones (id) ON DELETE SET NULL ON UPDATE NO ACTION,
          )
        ''');

        await db.execute('''
          CREATE TABLE Records(
            id INTEGER PRIMARY KEY,
            categoriaId INT,
            operacionId INT,
            descripcion TEXT,
            total REAL,
            imgs TEXT,
            cuentaId INT,
            fecha TIMESTAMP,
            FOREIGN KEY (categoriaId) REFERENCES Categorias (id) ON DELETE SET NULL ON UPDATE NO ACTION,
            FOREIGN KEY (cuentaId) REFERENCES Cuentas (id) ON DELETE SET NULL ON UPDATE NO ACTION,
            FOREIGN KEY (operacionId) REFERENCES Operaciones (id) ON DELETE SET NULL ON UPDATE NO ACTION,
          )
        ''');
      },
    );
  }
}
