import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:travellers/modules/cubit/cubit.dart';
import 'package:travellers/modules/cubit/states.dart';
import 'package:travellers/modules/cubit/theme_cubit.dart';
import 'package:travellers/modules/login_screen.dart';
import 'package:travellers/modules/on_boarding_screen.dart';
import 'package:travellers/modules/register_screen.dart';
import 'package:travellers/providers/pass_provider.dart';
import 'package:travellers/providers/theme_provider.dart';
import 'package:travellers/registerdatabase/register_data_base.dart';
import 'package:travellers/styles/themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await RegDataBase.createDatabase();

  runApp(MultiProvider(
    providers:
    [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => PasswordProvider()),
    ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
      theme: LightMode,
      darkTheme: DarkMode,
      themeMode: Provider.of<ThemeProvider>(context).isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}