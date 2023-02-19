import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'relic.dart';
import 'rewards.dart';
import '../constants/db_constants.dart';
import '../game_controller.dart';
import 'chapter.dart';
import 'hero.dart';
import 'user.dart';

class DatabaseReference {

  static final DatabaseReference instance = DatabaseReference._privateConstructor();

  static Database? _database;

  DatabaseReference._privateConstructor();

  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await _initiateDatabase();
    return _database!;
  }
  _initiateDatabase ()   async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/${DBConstants.dbName}';

    return await openDatabase(path, version: DBConstants.dbVersion,
        onOpen: (db) {
      if (kDebugMode) { print("onOpen eh"); }
      },

        onCreate: (db, version) {
      if (kDebugMode) { print("onCreate eh"); }
      _createBD(db);},

        onUpgrade: (db, oldVersion, newVersion) {
      if (kDebugMode) { print("onUpdate eh"); }
      _createBD(db);} );
  }
  _createBD(Database db) async {

    Batch batch = db.batch();

    batch.execute("PRAGMA legacy_file_format = TRUE;");

    // drop first
    batch.execute("DROP TABLE IF EXISTS ${DBConstants.userHeroTableName};");
    batch.execute("DROP TABLE IF EXISTS ${DBConstants.userRelicTableName};");
    batch.execute("DROP TABLE IF EXISTS ${DBConstants.userTableName};");

    batch.execute("DROP TABLE IF EXISTS ${DBConstants.heroTableName};");
    batch.execute("DROP TABLE IF EXISTS ${DBConstants.characterTableName};");
    batch.execute("DROP TABLE IF EXISTS ${DBConstants.relicTableName};");
    batch.execute("DROP TABLE IF EXISTS ${DBConstants.itemTableName};");

    batch.execute("DROP TABLE IF EXISTS ${DBConstants.chapterTableName};");
    batch.execute("DROP TABLE IF EXISTS ${DBConstants.rewardTableName};");

    // then create again
    batch.execute(DBConstants.createCharacterTable);
    batch.execute(DBConstants.createHeroTable);
    batch.execute(DBConstants.createItemTable);
    batch.execute(DBConstants.createRelicTable);

    batch.execute(DBConstants.createChapterTable);
    batch.execute(DBConstants.createUserTable);
    batch.execute(DBConstants.createUserHeroTable);
    batch.execute(DBConstants.createUserRelicTable);

    batch.execute(DBConstants.createRewardTable);

    await batch.commit();

    _addContent();
  }
  _addContent()          async {
    //FIRE CHARACTERS
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.SUN_WUKONG]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.AMATERASU]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.HADES]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.PELE]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.FENIX]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.LOKI]!.toMap());
    //EARTH CHARACTERS
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.MARIE_CURIE]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.ELFO]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.THALIA]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.DURGA]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.HATHOR]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.MAUI]!.toMap());
    //AIR CHARACTERS
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.VALKIRIA]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.EUTERPE]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.WRIGHT_BROTHERS]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.ADA_LOVELACE]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.AFRODITE]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.KAULU]!.toMap());
    //WATER CHARACTERS
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.NAGA_KANYA]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.POSEIDON]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.DIONISIO]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.LONG_MU]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.TSUKUYOMI]!.toMap());
    insert(DBConstants.characterTableName, DBConstants.characters[Heroes.ANUBIS]!.toMap());

    //ITEMS
    insert(DBConstants.itemTableName, DBConstants.items[Relics.CHALICE]!.toMap());
    insert(DBConstants.itemTableName, DBConstants.items[Relics.CROWN]!.toMap());
    insert(DBConstants.itemTableName, DBConstants.items[Relics.FLAIL]!.toMap());
    insert(DBConstants.itemTableName, DBConstants.items[Relics.MACE]!.toMap());
    insert(DBConstants.itemTableName, DBConstants.items[Relics.NECKLACE]!.toMap());
    insert(DBConstants.itemTableName, DBConstants.items[Relics.PAN]!.toMap());
    insert(DBConstants.itemTableName, DBConstants.items[Relics.POTION]!.toMap());
    insert(DBConstants.itemTableName, DBConstants.items[Relics.RING]!.toMap());
    insert(DBConstants.itemTableName, DBConstants.items[Relics.SHIELD]!.toMap());
    insert(DBConstants.itemTableName, DBConstants.items[Relics.SWORD]!.toMap());

    //REWARD LEVELS
    insert(DBConstants.rewardTableName, DBConstants.insertReward1);
    insert(DBConstants.rewardTableName, DBConstants.insertReward2);
    insert(DBConstants.rewardTableName, DBConstants.insertReward3);
    insert(DBConstants.rewardTableName, DBConstants.insertReward4);
    insert(DBConstants.rewardTableName, DBConstants.insertReward5);
    insert(DBConstants.rewardTableName, DBConstants.insertReward6);
    insert(DBConstants.rewardTableName, DBConstants.insertReward7);
    insert(DBConstants.rewardTableName, DBConstants.insertReward8);
    insert(DBConstants.rewardTableName, DBConstants.insertReward9);
    insert(DBConstants.rewardTableName, DBConstants.insertReward10);
    insert(DBConstants.rewardTableName, DBConstants.insertReward11);

    //CHAPTERS
    insert(DBConstants.chapterTableName, DBConstants.chapter1p1);
    insert(DBConstants.chapterTableName, DBConstants.chapter1p2);
    insert(DBConstants.chapterTableName, DBConstants.chapter1p3);
    insert(DBConstants.chapterTableName, DBConstants.chapter1p4);
    insert(DBConstants.chapterTableName, DBConstants.chapter1p5);
    insert(DBConstants.chapterTableName, DBConstants.chapter1p6);
    insert(DBConstants.chapterTableName, DBConstants.chapter1p7);
    insert(DBConstants.chapterTableName, DBConstants.chapter1p8);
    insert(DBConstants.chapterTableName, DBConstants.chapter1p9);
    insert(DBConstants.chapterTableName, DBConstants.chapter1p10);
    insert(DBConstants.chapterTableName, DBConstants.chapter2p1);
    insert(DBConstants.chapterTableName, DBConstants.chapter2p2);
    insert(DBConstants.chapterTableName, DBConstants.chapter2p3);

    //delete(GameConstants.userHeroTableName, GameConstants.userHeroUserCol, GameController.generateId().toString());

  }

  static initialize() async {
    await DatabaseReference.instance.database;
  }
  static User _createUser(String userId) {
    User user = User(userId);
    insert(DBConstants.userTableName, user.toMap());

    Her0 hero1 = Her0(GameController.generateId(), level: 1, character: DBConstants.characters[Heroes.ADA_LOVELACE]!);
    Her0 hero2 = Her0(GameController.generateId(), level: 1, character: DBConstants.characters[Heroes.LOKI]!);
    Her0 hero3 = Her0(GameController.generateId(), level: 1, character: DBConstants.characters[Heroes.NAGA_KANYA]!);
    Her0 hero4 = Her0(GameController.generateId(), level: 1, character: DBConstants.characters[Heroes.HATHOR]!);
    Her0 hero5 = Her0(GameController.generateId(), level: 1, character: DBConstants.characters[Heroes.LONG_MU]!);

    Relic relic1 = Relic(GameController.generateId(), level: 1, item: DBConstants.items[Relics.NECKLACE]!);
    Relic relic2 = Relic(GameController.generateId(), level: 1, item: DBConstants.items[Relics.PAN]!);

    addUserHero(userId, hero1);
    addUserHero(userId, hero2);
    addUserHero(userId, hero3);
    addUserHero(userId, hero4);
    addUserHero(userId, hero5);

    addUserRelic(userId, relic1);
    addUserRelic(userId, relic2);

    return user;
  }

  static Future<int> insert(String tableName, Map<String, dynamic> row)     async {
    Database db = await instance.database;
    return await db.insert(tableName, row);
  }
  static             delete(String tableName, String column, String userId) async {
    Database db = await instance.database;
    return await db.delete(tableName,
        where: '$column = ?', whereArgs: [userId]);
  }

  static Future<List<Map<String, dynamic>>> getUsers()   async {
    Database db = await instance.database;
    var table = await db.rawQuery("SELECT * FROM User");
    if (kDebugMode) {
      print(table);
    }
    return table;
  }
  static Future<List<Map<String, dynamic>>> getHeroes()  async {
    Database db = await instance.database;
    var table = await db.rawQuery("SELECT * FROM Character");
    // if (kDebugMode) { print("------------------------------------> ${table.length}"); }
    return table;
  }
  static Future<List<Map<String, dynamic>>> getRewards() async {
    Database db = await instance.database;
    var table = await db.rawQuery("SELECT * FROM Reward");
    // if (kDebugMode) { print(table); }
    return table;
  }

  static Future<User>    getUserData(String userId) async {
    Database db = await instance.database;
     var data = await db.query(DBConstants.userTableName, columns: DBConstants.userColumns,
         where: '${DBConstants.userIDCol} = ?', whereArgs: [userId]);
    // var data = await db.rawQuery(
    //     "SELECT * FROM ${GameConstants.userTableName} WHERE ${GameConstants.userIDCol} = $userId");

    bool k = data.isNotEmpty;
    if (k){
      for (var element in data) {
        User u = User.fromMap(element);
        return u;
        // return User.fromMap(element);
      }
    }
    return _createUser(userId);
  }
  static Future<Rewards> getRewardsLevel(int level) async {
    Database db = await instance.database;
    var data = await db.query(DBConstants.rewardTableName, columns: DBConstants.rewardColumns,
        where: '${DBConstants.rewardLevelCol} = ?', whereArgs: [level]);

    if (data.isNotEmpty){
      for (var element in data) {return Rewards.fromMap(element);}
    }
    return Rewards(0, DateTime.parse("1970-01-01 02:00:00"));
  }
  static Future<Chapter> getChapter(int chapterNumber, int chapterPart) async {
    Database db = await instance.database;
    var data = await db.query(DBConstants.chapterTableName, columns: DBConstants.chapterColumns,
        where: '${DBConstants.chapterCol} = ? AND ${DBConstants.chapterPartCol} = ?',
        whereArgs: [chapterNumber, chapterPart]);

    if (data.isNotEmpty){
      for (var element in data) {return Chapter.fromRTDB(element);}
    }
    return Chapter(0, 0, 0);
  }
  static Future<List<Map<String, dynamic>>> getMyHeroes(String userId)  async {
    Database db = await instance.database;

    var data = await db.rawQuery('''
    SELECT * FROM ${DBConstants.heroTableName} WHERE ${DBConstants.heroIDCol} IN 
    (SELECT ${DBConstants.userHeroHeroCol} FROM ${DBConstants.userHeroTableName} WHERE 
    ${DBConstants.userHeroUserCol} = "$userId")''');

    return data;
  }
  static Future<List<Map<String, dynamic>>> getMyRelics(String userId)  async {
    Database db = await instance.database;

    var data = await db.rawQuery('''
    SELECT * FROM ${DBConstants.relicTableName} WHERE ${DBConstants.relicIDCol} IN 
    (SELECT ${DBConstants.userRelicRelicCol} FROM ${DBConstants.userRelicTableName} WHERE 
    ${DBConstants.userRelicUserCol} = "$userId")''');

    return data;
  }
  static Future<List<Map<String, dynamic>>> getRelic(String relicId)    async {
    Database db = await instance.database;

    var data = await db.rawQuery(''' 
    SELECT * FROM ${DBConstants.relicTableName} WHERE ${DBConstants.relicIDCol} = "$relicId" ''');

    return data;
  }

  static updateTimeCollected()                          async {
    Database db = await instance.database;
    String time = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    GameController.user.setTimeCollected(time);
    await db.update(DBConstants.userTableName, GameController.user.toMap(),
        where: '${DBConstants.userIDCol} = ?',
        whereArgs: [GameController.user.getUserId()]);
  }
  static updateChapter(Chapter chapter)                 async {
    Database db = await instance.database;
    await db.update(DBConstants.chapterTableName, chapter.toMap(),
        where: '${DBConstants.chapterCol} = ? AND ${DBConstants.chapterPartCol} = ?',
        whereArgs: [chapter.getChapterNumber(), chapter.getPartNumber()]);
  }
  static updateUserStats(int exp, int fusion, int gems) async {

  }
  static updateUserHeroFighters(String userId, Map<int, Her0> fighters) async {
    Database db = await instance.database;
    await db.update(DBConstants.userTableName, GameController.user.toMap(),
        where: '''
        ${DBConstants.userFirstCol} = ? AND 
        ${DBConstants.userSecondCol} = ? AND
        ${DBConstants.userThirdCol} = ? AND
        ${DBConstants.userFourthCol} = ? 
        ''',
        whereArgs: [fighters[0]!.getHeroId(), fighters[1]!.getHeroId(),
          fighters[2]!.getHeroId(), fighters[3]!.getHeroId()]);
  }
  static updateHeroRelic(Her0 hero, Relic relic)                        async {
    Database db = await instance.database;

    var heroIdColQuery = ''' SELECT ${DBConstants.heroIDCol} FROM  ${DBConstants.heroTableName}
     WHERE ${DBConstants.heroRelicCol} = '${relic.getRelicId()}'  ''';

    var data = await db.rawQuery(heroIdColQuery);

    if (data.isNotEmpty) {

      List<Her0> myHeroes = GameController.getUser().getMyHeroes()!;

      for (var element in data) {
        await db.rawQuery(''' UPDATE ${DBConstants.heroTableName} SET ${DBConstants.heroRelicCol} = null 
        WHERE ${DBConstants.heroIDCol} = '${element[DBConstants.heroIDCol]}'   ''');

        for (Her0 myHero in myHeroes) {
          bool a = (myHero.getHeroId() == element[DBConstants.heroIDCol]);
          bool b = (myHero.getHeroId() != hero.getHeroId());
          if (myHero.getHeroId() == element[DBConstants.heroIDCol] &&
            myHero.getHeroId() != hero.getHeroId()) {
            myHero.setRelicId("");
            myHero.resetRelic();
            break;
          }
        }
      }
    }

    return await db.rawQuery(''' UPDATE ${DBConstants.heroTableName}
    SET ${DBConstants.heroRelicCol} = '${relic.getRelicId()}'
    WHERE ${DBConstants.heroIDCol} = '${hero.getHeroId()}'   ''');
  }

  static addUserHero(String userId, Her0 hero)    async {
    Map<String, dynamic> row = {
      DBConstants.userHeroUserCol: userId,
      DBConstants.userHeroHeroCol: hero.getHeroId()};
    await insert(DBConstants.heroTableName, hero.toMap());
    await insert(DBConstants.userHeroTableName, row);
  }
  static addUserRelic(String userId, Relic relic) async {
    Map<String, dynamic> row = {
      DBConstants.userRelicUserCol: userId,
      DBConstants.userRelicRelicCol: relic.getRelicId()};
    await insert(DBConstants.relicTableName, relic.toMap());
    await insert(DBConstants.userRelicTableName, row);
  }



}
