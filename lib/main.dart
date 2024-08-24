import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:randendgenerator/homepg/homepg.dart';

//APACHE 2.0

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('usrBox');
  runApp(
    MainApp(
      box: box,
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    required this.box,
  });
  final Box<dynamic> box;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePg(
        box: box,
      ),
    );
  }
}
