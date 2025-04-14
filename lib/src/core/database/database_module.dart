import 'package:ems/src/core/database/database_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@module
abstract class DatabaseModule {
  @singleton
  @preResolve
  Future<Database> provideDatabase(DatabaseHelper databaseHelper) async {
    return await databaseHelper.getDatabase();
  }
}
