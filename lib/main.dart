import 'package:flutter/material.dart';
import 'package:flutter_note/presentation/notes/notes_screen.dart';
import 'package:flutter_note/ui/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        backgroundColor: darkGray,
        canvasColor: darkGray,
        floatingActionButtonTheme:
          Theme.of(context).floatingActionButtonTheme.copyWith(
            backgroundColor: Colors.white,
            foregroundColor: darkGray,
          ),
        appBarTheme:
          Theme.of(context).appBarTheme.copyWith(
            backgroundColor: darkGray,
          ),
      ),
      home: const NotesScreen(),
    );
  }
}
