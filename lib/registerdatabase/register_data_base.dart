import 'package:sqflite/sqflite.dart';
import 'package:travellers/constants/constants.dart';
import 'package:travellers/user_data.dart';

class RegDataBase {
  static late Database database;

  static Future createDatabase() async {
    database = await openDatabase(
      'user.db',
      version: 2,
      onCreate: (database, version) async {
        print("database is Created");
        await database
            .execute(
          'CREATE TABLE userDB (id INTEGER PRIMARY KEY , username text ,email text ,date text, password text)',
        )
            .then((value) {
          print("Table Created");
        }).catchError((error) {
          print(error.toString());
        });
      },
      onOpen: (database) async
      {
        getData(database);
      },
    );
  }

  static Future insertToDatabase({
    required String username,
    required String email,
    required String date,
    required String password,
  }) async {
    await database
        .rawInsert(
      'INSERT INTO userDB (username ,email,date, password) VALUES ("$username" , "$email" , "$date","$password")',
    )
        .then((value) {
      print('$value inserted Successfully');
    }).catchError((error) {
      print(error.toString());
    });
  }

  static void getData(Database database) {
    database.rawQuery('SELECT * FROM userDB').then((value) {
      for (var element in value) {
        data.add(
          UserData(
            id: element['id'] as int,
            userName: element['username'] as String,
            Password: element['password'] as String,
            Email: element['email'] as String,
            DateOfBirth: element['date'] as String,
          )
        );
      }
    }).catchError((error){
      print(error.toString());
    });

  }
  static void updateDatabase(String username,String email,String date, String password , int id){
    database.rawUpdate(
        'update  userDB set username = ?,email=?,date=?, password =?  where id = ?',[username,email,date,password,id]
    ).
    then((value){
      print(value);
    }).
    catchError((error){
      print(error.toString());
    });


  }


}
