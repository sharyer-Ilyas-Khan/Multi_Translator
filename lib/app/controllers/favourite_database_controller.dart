import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
class FavouriteDatabaseController extends GetxController {

  Database? db;
  RxList uniRecords=[].obs;
  RxList voiceRecords=[].obs;
  RxList multiRecords=[].obs;
  //uni queries
  //table name = UniFav
  String createUniFav="CREATE TABLE uni_fav (id INTEGER PRIMARY KEY, 'from' TEXT, 'from_data' TEXT, 'to' TEXT, 'to_data' TEXT)";
  String readUniFav="SELECT * FROM uni_fav";
  String insertUniFav="INSERT INTO uni_fav('from' , 'from_data', 'to','to_data') VALUES('eng','abc','ur','alif')";
  String deleteUniFav="DELETE FROM uni_fav WHERE id = 1";
  //voice queries
  //table name = VoiceFav
  String createVoiceFav="CREATE TABLE voice_fav (id INTEGER PRIMARY KEY, 'from' TEXT, 'from_data' TEXT, 'to' TEXT, 'to_data' TEXT)";
  String readVoiceFav="SELECT * FROM voice_fav";
  String insertVoiceFav="INSERT INTO voice_fav('from', 'from_data', 'to','to_data') VALUES('eng','abc','ur','alif')";
  String deleteVoiceFav="DELETE FROM voice_fav WHERE id = 1";
  //multi queries
  //table name = MultiFav
  String createMultiFav="CREATE TABLE multi_fav (id INTEGER PRIMARY KEY, 'from' TEXT, 'from_data' TEXT, 'to' LIST, 'to_data' LIST)";
  String readMultiFav="SELECT * FROM multi_fav";
  String insertMultiFav="INSERT INTO multi_fav('from', 'from_data', 'to','to_data') VALUES('eng','abc','[ur,GR]','[alif,'JE']')";
  String deleteMultiFav="DELETE FROM multi_fav WHERE id =1";

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
  void databaseConnect()async{
    db=await openDatabase("multi_translation.db");
    createTableFavourite();

  }

  /// creating tables
void createTableFavourite() async{
    try{
      await db!.execute(createUniFav);
      await db!.execute(createVoiceFav);
      await db!.execute(createMultiFav);
    }
    catch(e){
      print("All Ready created${e.toString()}");
    }

}


/// uni translation operations
  void getRecordFromUniFavourite()async{
    await db!.rawQuery(readUniFav).then((value){
      uniRecords.value=value;
      print(value);
    });
  }
  void addToUniFavourite(from,fromData,to,toData)async{
    await db!.rawInsert("INSERT INTO uni_fav ('from', 'from_data', 'to', 'to_data') VALUES('$from','$fromData','$to','$toData')");
  }
  void removeFromUniFavourite(id)async{
    await db!.rawDelete("DELETE FROM uni_fav WHERE id = $id");
    getRecordFromUniFavourite();
  }

///voice translation operations
  void getRecordFromVoiceFavourite()async{
    await db!.rawQuery(readVoiceFav).then((value){
      voiceRecords.value=value;
      print(value);
    });
  }
  void addToVoiceFavourite(from,fromData,to,toData)async{
    await db!.rawInsert("INSERT INTO voice_fav('from', 'from_data', 'to','to_data') VALUES('$from','$fromData','$to','$toData')");
  }
  void removeFromVoiceFavourite(id)async{
    await db!.rawDelete("DELETE FROM voice_fav WHERE id = $id");
    getRecordFromVoiceFavourite();
  }

///multi translation operation
  void getRecordFromMultiFavourite()async{
    await db!.rawQuery(readMultiFav).then((value){
      multiRecords.value=value;
      print(value);
    });
  }
  void addToMultiFavourite(from,fromData,toList,toDataList)async{
    await db!.rawInsert('INSERT INTO multi_fav("from", "from_data", "to","to_data") VALUES("$from","$fromData","$toList","$toDataList")');
  }
  void removeFromMultiFavourite(id)async{
    print(id);
    await db!.rawDelete("DELETE FROM multi_fav WHERE id = $id");
    getRecordFromMultiFavourite();
  }

  Future<String> getId(type,fromData) async {
    String id="";
    await db!.rawQuery("SELECT id FROM ${type}_fav Where from_data== '${fromData}'").then((value){
      id=value[0]['id'].toString();
    });
    return id;
  }
}
