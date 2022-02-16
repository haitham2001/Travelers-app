// TODO Implement this library.








import 'package:sqflite/sqflite.dart';
import 'package:travellers/BookedTickets.dart';
import 'package:travellers/Ticket.dart';
import 'package:travellers/constants/constants.dart';
import 'package:travellers/user_data.dart';

class AllTicketsData {
  static late Database database;

  static Future createDataBase() async {
    database = await openDatabase(
      'allticketsdatabasetabelsa'
          '.db',
      version: 2,
      onCreate: (database, version) async {
        print("tickets database is Created");
        await database
            .execute(
          'CREATE TABLE AllTicketsDatatTable (id INTEGER PRIMARY KEY , fromticket text ,toticket text ,typeidticket INTEGER, typeticket text,price INTEGER, available INTEGER,date text)',
        )
            .then((value) {
          print("Tickets Table Created");
        }).catchError((error) {
          print(error.toString());
        });

        await database
            .execute(
          'CREATE TABLE AllBookdeTicketsDatatTable (bookedid INTEGER PRIMARY KEY ,userid INTEGER, ticketid INTEGER,quantity INTEGER )',
        )
            .then((value) {
          print("Booked table is created Created");
        }).catchError((error) {
          print(error.toString());
        });
      },
      onOpen: (database) async
      {
        //getData(database);
      },
    );
  }

  static Future insertToTicketDatabase({
    required String from,
    required String to,
    required int typeID,
    required String type,
    required int price,
    required int available,
    required String date,
  }) async {
    await database
        .rawInsert(
      'INSERT INTO AllTicketsDatatTable ( fromticket ,toticket ,typeidticket , typeticket ,price , available ,date ) VALUES ("$from" , "$to" , "$typeID","$type","$price","$available","$date")',
    )
        .then((value) {
      print('$value inserted Successfully');
    }).catchError((error) {
      print(error.toString());
    });
  }


  static Future insertToBookedTicketDatabase({
    required int userId,
    required int ticketID,
    required int quantity,
  }) async {
    await database
        .rawInsert(
      'INSERT INTO AllBookdeTicketsDatatTable (userid ,ticketid ,quantity) VALUES ("$userId" , "$ticketID" , "$quantity")',
    )
        .then((value) {
      print('$value ticket booked Successfully');
    }).catchError((error) {
      print(error.toString());
    });
  }

  static void getTicketData() {
    database.rawQuery('SELECT * FROM AllTicketsDatatTable').then((value) {
      for (var element in value) {
        ticketsData.add(
            Ticket(id: element['id'] as int,
                from: element['fromticket'] as String,
                to: element['toticket'] as String,
                typeId: element['typeidticket'] as int,
                type: element['typeticket'] as String,
                price: element['price'] as int,
                available: element['available'] as int,
                date: element['date'] as String)
        );
      }
      //return ticketsData;
    }).catchError((error) {
      print(error.toString());
    });
  }

  static void getBookedTicketData() {
    database.rawQuery('SELECT * FROM AllBookdeTicketsDatatTable').then((value) {
      for (var element in value) {
        bookedTicketsData.add(
            BookedTickets(userId: element['userid'] as int,
                ticketId: element['ticketid'] as int,
                quantity: element['quantity'] as int)
        );
      }
      //return ticketsData;
    }).catchError((error) {
      print(error.toString());
    });
  }

static void updateBookedDatabase(
    String from,
   String to,
   int typeID,
   String type,
   int price,
   int available,
   String date,
    int id,) {
  database.rawUpdate(
      'update AllTicketsDatatTable set fromticket =? , toticket =? , typeidticket =?, typeticket =?, price =?, available =?, date=?  where id = ?', [from,to,typeID,type,price,available,date, id]

  ).
  then((value) {
    print(value);
  }).
  catchError((error) {
    print(error.toString());
  });
}

}