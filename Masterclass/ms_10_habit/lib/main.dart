import 'package:flutter/material.dart';
import 'package:ms_10_habit/database/habit_database.dart';
import 'package:ms_10_habit/pages/home_page.dart';
import 'package:ms_10_habit/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    //initialize dbs
    await HabitDatabase.initialize();
    await HabitDatabase().saveFirstLaunchDate();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> HabitDatabase()),
        ChangeNotifierProvider(create: (context)=> ThemeProvider()),
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
      home:HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}