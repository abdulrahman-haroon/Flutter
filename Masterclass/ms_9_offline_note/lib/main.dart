import 'package:flutter/material.dart';
import 'package:ms_9_offline_note/Pages/note_page.dart';
import 'package:ms_9_offline_note/models/note_database.dart';
import 'package:ms_9_offline_note/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async{

  //initialize note isar database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  runApp(
    MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) => NoteDatabase()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp()

    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
