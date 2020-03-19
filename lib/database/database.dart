import 'dart:io';

import 'package:flutterappweb/model/User.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "CinemaDB.db");
    print(path);
    return await openDatabase(path, version: 1, onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db
          .execute("CREATE TABLE Users ("
          "id INTEGER AUTO_INCREMENT PRIMARY KEY,"
          "username TEXT,"
          "password TEXT"
          ")");
//          .then((_) async {
//          await db
//            .execute("CREATE TABLE Question ("
//            "id INTEGER AUTO_INCREMENT PRIMARY KEY,"
//            "question_id TEXT,"
//            "question TEXT,"
//            "answer_a TEXT,"
//            "answer_b TEXT,"
//            "answer_c TEXT,"
//            "answer_d TEXT,"
//            "number_of_answers TEXT,"
//            "explanation TEXT,"
//            "answer TEXT,"
//            "response TEXT,"
//            "link_to_image TEXT,"
//            "correct_points TEXT,"
//            "wrong_points TEXT,"
//            "test_id TEXT"
//            ")")
//            .then((_) async {
//            await db.execute("CREATE TABLE Configuration ("
//              "id TEXT PRIMARY KEY,"
//              "state TEXT,"
//              "vehicle TEXT,"
//              "language TEXT,"
//              "current_test INTEGER,"
//              "current_question INTEGER,"
//              "cheat_sheet TEXT"
//              ")");
//          });
//        });
      });
  }

  Future<int> newUser(User newUser)async{
    final db = await database;
    var raw = await db.rawInsert(
      "INSERT Into Users (username,password)"
        " VALUES (?,?)",
      [
        newUser.username,
        newUser.password,
      ]);
    return raw;
  }

//  Future<int> newTest(Test newTest) async {
//    final db = await database;
//    var raw = await db.rawInsert(
//      "INSERT Into Test (title,number_of_questions,number_of_errors,number_of_errors_sign,calculation_type,serie_id,first_time,test_state,tc_id)"
//        " VALUES (?,?,?,?,?,?,?,?,?)",
//      [
//        newTest.title,
//        newTest.numberOfQuestions,
//        newTest.numberOfErrors,
//        newTest.numberOfErrorsSign,
//        newTest.calculationType,
//        newTest.serieId,
//        newTest.firstTime,
//        newTest.state.toString(),
//        newTest.testConfigurationID
//      ]);
////    FLog.info(text: "CREATE NEW TEST");
////    FLog.exportLogs();
//    for (Question question in newTest.questions) {
//      await newQuestion(question);
//    }
//    return raw;
//  }
//
//  Future<int> newQuestion(Question newQuestion) async {
//    final db = await database;
//    var raw = await db.rawInsert(
//      "INSERT Into Question (question_id,question,answer_a,answer_b,answer_c,answer_d,number_of_answers,explanation,answer,response,link_to_image,correct_points,wrong_points,test_id)"
//        " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
//      [
//        newQuestion.questionID,
//        newQuestion.question,
//        newQuestion.answerA,
//        newQuestion.answerB,
//        newQuestion.answerC,
//        newQuestion.answerD,
//        newQuestion.numberOfAnswers,
//        newQuestion.explanation,
//        newQuestion.answer,
//        newQuestion.response,
//        newQuestion.linkToImage,
//        newQuestion.correctPoints,
//        newQuestion.wrongPoints,
//        newQuestion.testID
//      ]);
//
//    if (newQuestion.linkToImage != null){
//      get(newQuestion.linkToImage).then((response) {
//        getApplicationDocumentsDirectory().then((documentDirectory) {
//          var localPath = Random.secure().nextInt(2000000).toString() + "_image.png";
//          File file = new File(join(documentDirectory.path,
//            localPath));
//          //     print("Image saved#####################");
//          file.writeAsBytesSync(response.bodyBytes);
//          newQuestion.linkToImage = localPath;
//          updateQuestion(newQuestion);
//        });
//      });
//    }
//    return raw;
//  }
//
//
//  updateTest(Test newTest) async {
//    final db = await database;
//    var res = await db.update("Test", newTest.toMap(),
//      where: "tc_id = ? and serie_id = ?", whereArgs: [newTest.testConfigurationID,newTest.serieId]);
//    return res;
//  }
//
//  updateQuestion(Question newQuestion) async {
//    final db = await database;
//    var res = db.update("Question", newQuestion.toMap(),
//      where: "question_id = ?", whereArgs: [newQuestion.questionID]);
//    return res;
//  }
//
//  Future<List<Test>> getLocalTests(String testConfigurationId) async {
//    final db = await database;
//    var res = await db
//      .query("Test", where: "tc_id = ?", whereArgs: [testConfigurationId]);
//    List<Test> list = res.isNotEmpty
//      ? res.map((c) {
//      Test test = Test.fromJson(c);
//      return test;
//    }).toList()
//      : [];
//    for (Test test in list) {
//      var questionRes = await db.query("Question",
//        where: "test_id = ?",
//        whereArgs: [test.serieId.toString() + testConfigurationId]);
//      List<Question> ques = questionRes.isNotEmpty
//        ? questionRes
//        .map((q) {
//        return Question.fromJson(q);
//      })
//        .toList()
//        .cast<Question>()
//        : [];
//      test.questions = ques.toList();
//    }
////    FLog.info(text: "RETURN LOCAL TESTS");
////    FLog.exportLogs();
//    return list;
//  }
//
  deleteDB() async {
    final db = await database;
    await db.delete("Users");
//      .then((_) async {
//      await db.delete("Question").then((_) {});
//    });
  }
//
//  Future<int> newTestConfiguration(String state, String vehicle,
//    String language, int currentTest, int currentQuestion,String cheatSheet) async {
//    final db = await database;
//    var ret = await db.delete("Configuration",
//      where: "id = ?",
//      whereArgs: [vehicle + state + language]).then((_) async {
//      var raw = await db.rawInsert(
//        "INSERT Into Configuration (id,state,vehicle,language,current_test,current_question,cheat_sheet)"
//          " VALUES (?,?,?,?,?,?,?)",
//        [
//          vehicle + state + language,
//          state,
//          vehicle,
//          language,
//          currentTest,
//          currentQuestion,
//          cheatSheet
//        ]);
//
//      return raw;
//    });
//    return ret;
//  }
//
//  Future saveConfiguration(TestConfiguration testConfiguration) async {
//    await newTestConfiguration(
//      testConfiguration.state,
//      testConfiguration.vehicle,
//      testConfiguration.language,
//      testConfiguration.currentTest,
//      testConfiguration.currentQuestion,
//      testConfiguration.cheatSheet);
//    final db = await database;
//    var batch = db.batch();
//    for (Test newTest in testConfiguration.tests)
//    {
//
////          FLog.info(
////              text: "saving test ${newTest.serieId}");
////          FLog.exportLogs();
////          print("saving test ${newTest.serieId}");
//      batch.rawInsert(
//        "INSERT Into Test (title,number_of_questions,number_of_errors,number_of_errors_sign,calculation_type,serie_id,first_time,test_state,tc_id)"
//          " VALUES (?,?,?,?,?,?,?,?,?)",
//        [
//          newTest.title,
//          newTest.numberOfQuestions,
//          newTest.numberOfErrors,
//          newTest.numberOfErrorsSign,
//          newTest.calculationType,
//          newTest.serieId,
//          newTest.firstTime,
//          newTest.state.toString(),
//          newTest.testConfigurationID
//        ]);
//      for(Question newQuestion in newTest.questions){
////            FLog.info(
////                text: "saving question ${newQuestion.questionID}");
////            FLog.exportLogs();
////            print("saving question ${newQuestion.questionID}");
//        batch.rawInsert(
//          "INSERT Into Question (question_id,question,answer_a,answer_b,answer_c,answer_d,number_of_answers,explanation,answer,response,link_to_image,correct_points,wrong_points,test_id)"
//            " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
//          [
//            newQuestion.questionID,
//            newQuestion.question,
//            newQuestion.answerA,
//            newQuestion.answerB,
//            newQuestion.answerC,
//            newQuestion.answerD,
//            newQuestion.numberOfAnswers,
//            newQuestion.explanation,
//            newQuestion.answer,
//            newQuestion.response,
//            newQuestion.linkToImage,
//            newQuestion.correctPoints,
//            newQuestion.wrongPoints,
//            newQuestion.testID
//          ]);
//
//
//        if (newQuestion.linkToImage != null){
//          saveImageForQuestion(newQuestion, 0);
//        }
//      }
//    }
//    await batch.commit(noResult: true);
//  }
//
//  Future saveImageForQuestion(Question newQuestion, int retryCount) async {
//    try {
////      FLog.info(
////          text: "saving image retry: $retryCount");
////      FLog.exportLogs();
////      print("saving image retry: $retryCount");
//      var response = await get(newQuestion.linkToImage);
////      FLog.info(
////          text: "got image");
////      FLog.exportLogs();
////      print("got image");
//      var documentDirectory = await getApplicationDocumentsDirectory();
//      try {
////            FLog.info(
////                text: "saving file image");
////            FLog.exportLogs();
////            print("saving file image");
//        //       print("Image save "+newQuestion.linkToImage+" retry:"+retryCount.toString());
//        final localPath = Random.secure().nextInt(2000000).toString() + "_image.png";
//        File file = new File(join(documentDirectory.path,
//          localPath));
//        file.writeAsBytesSync(response.bodyBytes);
//        newQuestion.linkToImage = localPath;
////            FLog.info(
//        updateQuestion(newQuestion);
////                text: "update image");
////            FLog.exportLogs();
////            print("update image");
////            updateQuestion(newQuestion);
////
////            FLog.info(
////                text: "saved image");
////            FLog.exportLogs();
////            print("saved image");
//      } catch ( e ) {
////            FLog.info(
////                text: " Error save image ${e.toString()}");
////            FLog.exportLogs();
////            print(" Error save image ${e.toString()}");
//      }
//    } catch ( e ) {
//      if( retryCount < 3 )
//        saveImageForQuestion(newQuestion, (retryCount + 1));
//
////      FLog.info(
////          text: " Error save config ${e.toString()}");
////      FLog.exportLogs();
////      print(" Error save config ${e.toString()}");
//    }
//  }
//
//  Future<TestConfiguration> getTestConfiguration(
//    String stateAbbreviation, String vehicle, String language) async {
//    final db = await database;
//    var res = await db.query("Configuration",
//      where: "id = ?", whereArgs: [vehicle + stateAbbreviation + language]);
//    TestConfiguration testConfiguration =
//    res.isNotEmpty ? TestConfiguration.fromJson(res.first) : null;
//    if (testConfiguration != null)
//      testConfiguration.tests =
//      await getLocalTests(vehicle + stateAbbreviation + language);
//    return testConfiguration;
//  }
//
//  Future updateConfiguration(TestConfiguration testConfiguration) async {
//    final db = await database;
//    var res = db.update("Configuration", testConfiguration.toMap(),
//      where: "id = ?",
//      whereArgs: [
//        testConfiguration.vehicle +
//          testConfiguration.state +
//          testConfiguration.language
//      ]);
//    return res;
//  }
//
//  Future<Question> getQuestion(String questionID) async {
//    final db = await database;
//    var res = await db.query("Question",
//      where: "question_id = ?", whereArgs: [questionID]);
//    Question question =
//    res.isNotEmpty ? Question.fromJson(res.first) : null;
//    return question;
//  }
//
//  Future removeQuestion(Question q) async {
//    final db = await database;
//    await db.delete("Question",
//      where: "question_id = ?",
//      whereArgs: [q.questionID]);
//  }
}