import 'package:cardsearch/data/database/database_config.dart';
import 'package:cardsearch/data/database/database_service.dart';
import 'package:cardsearch/data/database/tables/user_table.dart';
import 'package:cardsearch/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? databasesPath = await getDatabasesPath();
  var path = join(databasesPath, DatabaseConfig.databaseName);
  // Check if the database exists
  var exists = await databaseExists(path);
  if (!exists) {
    await DatabaseService.instance.database;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
