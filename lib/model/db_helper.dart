import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import './term.dart';

class ChessDatabasHelper {
  Database _db;

  Future<void> init() async {
    io.Directory applicationDirectory =
        await getApplicationDocumentsDirectory();

    String dbPathChess =
        path.join(applicationDirectory.path, "mainDatabase.db");

    bool dbExistsChess = await io.File(dbPathChess).exists();

    if (!dbExistsChess) {
      ByteData data =
          await rootBundle.load(path.join("assets", "mainDatabase.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await io.File(dbPathChess).writeAsBytes(bytes, flush: true);
    }

    _db = await openDatabase(dbPathChess);
  }

  Future<List<ChessTerm>> getAllTheTerms() async {
    if (_db == null) {
      throw "bd is not initiated, initiate using [init(db)] function";
    }
    List<Map> terms;

    await _db.transaction((txn) async {
      terms = await txn.query(
        "terms",
        columns: [
          "id",
          "term",
          "definition",
        ],
      );
    });

    return terms.map((e) => ChessTerm.fromJson(e)).toList();
  }
}
