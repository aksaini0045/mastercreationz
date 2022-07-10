import 'package:flutter/material.dart';
import 'package:mastercreationz/screens/mainscreen.dart';

void main() {
  runApp(const MasterCreationz());
}

class MasterCreationz extends StatelessWidget {
  const MasterCreationz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Master Creationz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen());
  }
}
