import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_fsqlite/DbHelper/dbHelper.dart';
import 'package:flutter_fsqlite/Notification.dart';
import 'package:flutter_fsqlite/TestPage.dart';
// change `flutter_database` to whatever your project name is


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQFlite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;

  TextEditingController textc1 = TextEditingController();
  TextEditingController textc2 = TextEditingController();
  // homepage layout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sqflite'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
          )

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              height: 300,
              width: 300,
              child: Image.asset("images/img.png",fit: BoxFit.fill,),
            ),
            Container(
              child: Image.network('https://miro.medium.com/max/2560/1*1orxIbVfgZa4mB_qEL17Yg.jpeg'),
            ),
            GestureDetector(
              onTap: (){
                print('Container working');

              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 100,
                width: 100,

                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red,width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(3, 7), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Text("Flutter app development \n learing about font. Test Font",
                    style: TextStyle(
                        fontFamily: 'Alata',
                        fontStyle: FontStyle.normal
                    ),),
                ),
              ),
            ),
            Card(
              elevation: 15,
              child: Container(
                  height: 100,
                  width: 100,
                  child: Text("Test Card")),
            ),
          RaisedButton(
            child: Text("Button"),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationFirebase()));
            },
          ),
          ],
        ),
      ),
    );
  }

  // Button onPressed methods

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : textc1.text,
      DatabaseHelper.columnAge  : textc2.text
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  void _update() async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnId   : 1,
      DatabaseHelper.columnName : 'Mary',
      DatabaseHelper.columnAge  : 32
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }
}