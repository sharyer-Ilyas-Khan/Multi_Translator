import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class HistoryDatabaseController extends GetxController {
  Database? db;
  RxList uniRecords = [].obs;
  RxList voiceRecords = [].obs;
  RxList multiRecords = [].obs;
  //uni queries
  //table name = UniHistory
  String createUniHistory =
      "CREATE TABLE uni_history (id INTEGER PRIMARY KEY, 'from' TEXT, 'from_data' TEXT, 'to' TEXT, 'to_data' TEXT)";
  String readUniHistory = "SELECT * FROM uni_history";
  String insertUniHistory =
      "INSERT INTO uni_history('from', 'from_data', 'to','to_data') VALUES('eng','abc','ur','alif')";
  String deleteUniHistory = "DELETE FROM uni_history WHERE id = 1";
  //voice queries
  //table name = VoiceHistory
  String createVoiceHistory =
      "CREATE TABLE voice_history (id INTEGER PRIMARY KEY, 'from' TEXT, 'from_data' TEXT, 'to' TEXT, 'to_data' TEXT)";
  String readVoiceHistory = "SELECT * FROM voice_history";
  String insertVoiceHistory =
      "INSERT INTO voice_history('from', 'from_data', 'to','to_data') VALUES('eng','abc','ur','alif')";
  String deleteVoiceHistory = "DELETE FROM voice_history WHERE id = 1";
  //multi queries
  //table name = MultiHistory
  String createMultiHistory =
      "CREATE TABLE multi_history (id INTEGER PRIMARY KEY, 'from' TEXT, 'from_data' TEXT, 'to' LIST, 'to_data' LIST)";
  String readMultiHistory = "SELECT * FROM multi_history";
  String insertMultiHistory =
      "INSERT INTO multi_history('from', 'from_data', 'to','to_data') VALUES('eng','abc','[ur,GR]','[alif,'JE']')";
  String deleteMultiHistory = "DELETE FROM multi_history WHERE id =1";

  @override
  void onInit() {
    databaseConnect();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    db!.close();
    super.onClose();
  }

  /// open database
  void databaseConnect() async {
    db = await openDatabase("multi_translation.db");
    createTableHistory();
  }

  /// creating tables
  void createTableHistory() async {
    try {
      await db!.execute(createUniHistory);
      await db!.execute(createVoiceHistory);
      await db!.execute(createMultiHistory);
    } catch (e) {
      print("All Ready created${e.toString()}");
    }
  }

  /// uni translation operations
  void getRecordFromUniHistory() async {
    await db!.rawQuery(readUniHistory).then((value) {
      uniRecords.value = value;
      print(value);
    });
  }

  void addToUniHistory(from, fromData, to, toData) async {
    await db!.rawInsert(
        "INSERT INTO uni_history('from', 'from_data', 'to','to_data') VALUES('$from','$fromData','$to','$toData')");
  }

  void removeToUniHistory(id) async {
    await db!.rawDelete("DELETE FROM uni_history WHERE id = $id");
  }

  ///voice translation operations
  void getRecordFromVoiceHistory() async {
    await db!.rawQuery(readVoiceHistory).then((value) {
      print(value);
    });
  }

  void addToVoiceHistory(from, fromData, to, toData) async {
    await db!.rawInsert(
        "INSERT INTO voice_history('from', 'from_data', 'to','to_data') VALUES('$from','$fromData','$to','$toData')");
  }

  void removeToVoiceHistory(id) async {
    await db!.rawDelete("DELETE FROM voice_history WHERE id = $id");
  }

  ///multi translation operation
  void getRecordFromMultiHistory() async {
    await db!.rawQuery(readMultiHistory).then((value) {
      print(value);
    });
  }

  void addToMultiHistory(from, fromData, toList, toDataList) async {
    await db!.rawInsert(
        "INSERT INTO multi_history('from', 'from_data', 'to','to_data') VALUES('$from','$fromData','$toList','$toDataList')");
  }

  void removeToMultiHistory(id) async {
    await db!.rawDelete("DELETE FROM multi_history WHERE id = $id");
  }
}
