import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseAssistant {

  static final String databaseName = "getir.sqlite";

  static Future<Database> databaseAcces() async{
    String databasePath = join(await getDatabasesPath(),databaseName);
    if(await databaseExists(databasePath)){
      print("Database daha önceden kopyalandı");
    }else{
      ByteData data = await rootBundle.load("database/$databaseName");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(databasePath).writeAsBytes(bytes,flush: true);
      print("Database kopyalandı");
    }
    return openDatabase(databasePath);
  }

}