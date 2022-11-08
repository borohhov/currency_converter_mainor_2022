import 'package:currency_converter/model/currency_conversion_history.dart';
import 'package:currency_converter/widgets/history_screen.dart';
import 'package:currency_converter/widgets/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (context) => CurrencyConversionHistory(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Currency Converter",
      routes: {
        '/': (context) => MainScreen(),
        '/history': (context) => const HistoryScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      )
    );
  }
}
