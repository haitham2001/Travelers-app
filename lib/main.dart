import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:travellers/TicketDatabase/TicketDataBase.dart';
import 'package:travellers/constants/constants.dart';
import 'package:travellers/modules/home_screen.dart';
import 'package:travellers/modules/login_screen.dart';
import 'package:travellers/modules/on_boarding_screen.dart';
import 'package:travellers/modules/profile_screen.dart';
import 'package:travellers/modules/register_screen.dart';
import 'package:travellers/modules/start_screen.dart';
import 'package:travellers/providers/pass_provider.dart';
import 'package:travellers/providers/theme_provider.dart';
import 'package:travellers/registerdatabase/register_data_base.dart';
import 'package:travellers/styles/themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await RegDataBase.createDatabase();
  await AllTicketsData.createDataBase();
  AllTicketsData.getBookedTicketData();
  AllTicketsData.getTicketData();
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
      home: const OnBoardingScreen(),
      theme: LightMode,
      darkTheme: DarkMode,
      themeMode: Provider.of<ThemeProvider>(context).isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }


}
