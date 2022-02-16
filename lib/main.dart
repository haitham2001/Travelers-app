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
  if(ticketsData.length<10)
    {
      addData();
    }
  runApp(MultiProvider(
    providers:
    [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => PasswordProvider()),
    ],
      child: const MyApp()));
}

void addData()
{
  // AllTicketsData.insertToTicketDatabase(from: "Egypt", to: "Italy", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 6000 , available: 15, date: "1/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Egypt", to: "Russia", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 8000 , available: 15, date: "2/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Egypt", to: "Saudi", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 1936 , available: 15, date: "3/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Egypt", to: "Libya", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 1000 , available: 15, date: "4/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Egypt", to: "France", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 5000 , available: 15, date: "5/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Egypt", to: "Spain", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 10000 , available: 15, date: "6/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Egypt", to: "China", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 7500 , available: 15, date: "7/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Egypt", to: "Palestine", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 6000 , available: 15, date: "8/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Egypt", to: "Morocco", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 3000 , available: 15, date: "9/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Egypt", to: "Germany", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 5500 , available: 15, date: "10/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Germany", to: "France", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 1000 , available: 15, date: "11/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Russia", to: "Italy", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 1000 , available: 15, date: "12/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Saudi", to: "Italy", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 4000 , available: 15, date: "13/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Libya", to: "China", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 13000 , available: 15, date: "14/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Morocco", to: "Saudi", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 6500 , available: 15, date: "15/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Morocco", to: "France", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 8000 , available: 15, date: "16/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Palestine", to: "Egypt", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 8000 , available: 15, date: "17/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Italy", to: "France", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 8000 , available: 15, date: "18/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Egypt", to: "Italy", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 8000 , available: 15, date: "19/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "France", to: "Libya", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 5000 , available: 15, date: "20/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Egypt", to: "Italy", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 8000 , available: 15, date: "21/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Italy", to: "Russia", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 4000 , available: 15, date: "22/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "China", to: "Germany", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 13000 , available: 15, date: "23/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "France", to: "China", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 12000 , available: 15, date: "24/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Germany", to: "Italy", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 1800 , available: 15, date: "25/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Palestine", to: "France", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 8000 , available: 15, date: "26/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "China", to: "Germany", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 8000 , available: 15, date: "27/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Palestine", to: "Italy", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 9000 , available: 15, date: "28/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Morocco", to: "Italy", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 2000 , available: 15, date: "29/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Palestine", to: "Italy", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 9000 , available: 15, date: "30/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "France", to: "Italy", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 1000 , available: 15, date: "1/4/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Palestine", to: "Italy", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 9000 , available: 15, date: "2/4/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Germany", to: "Morocco", typeID: Icons.airplanemode_active.codePoint, type: Icons.airplanemode_active.fontFamily.toString() , price: 10000 , available: 15, date: "3/4/2022/");
  // //
  // //
  // AllTicketsData.insertToTicketDatabase(from: "Aswan", to: "Luxor", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 20 , available: 15, date: "1/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Cairo", to: "Alexandria", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 65 , available: 15, date: "2/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Giza", to: "Aswan", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 100 , available: 15, date: "3/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Cairo", to: "Fayoum", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 50 , available: 15, date: "4/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Cairo", to: "Giza", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 10 , available: 15, date: "5/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Giza", to: "Luxor", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 100 , available: 15, date: "6/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Alexandria", to: "Giza", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 45 , available: 15, date: "7/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Alexandria", to: "Cairo", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 65 , available: 15, date: "8/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Fayoum", to: "Aswan", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 80, available: 15, date: "9/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Cairo", to: "Luxor", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 120 , available: 15, date: "10/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Alexandria", to: "Luxor", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 130 , available: 15, date: "11/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Fayoum", to: "Luxor", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 50 , available: 15, date: "12/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Cairo", to: "Luxor", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 120 , available: 15, date: "13/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Luxor", to: "Aswan", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 10 , available: 15, date: "14/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Luxor", to: "Cairo", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 120 , available: 15, date: "15/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Luxor", to: "Alexandria", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 130 , available: 15, date: "16/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Giza", to: "Alexandria", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 45 , available: 15, date: "17/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Luxor", to: "Cairo", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 120, available: 15, date: "18/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Luxor", to: "Aswan", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 20 , available: 15, date: "19/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Alexandria", to: "Giza", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 45 , available: 15, date: "20/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Luxor", to: "Cairo", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 120 , available: 15, date: "21/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Aswan", to: "Giza", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 100 , available: 15, date: "22/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Aswan", to: "Fayoum", typeID: Icons.directions_bus.codePoint, type: Icons.directions_bus.fontFamily.toString() , price: 80 , available: 15, date: "23/5/2022/");
  //
  //
  // AllTicketsData.insertToTicketDatabase(from: "Cairo", to: "Luxor", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 80 , available: 15, date: "18/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Cairo", to: "Alexandria", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 50 , available: 15, date: "20/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Cairo", to: "Fayoum", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 30 , available: 15, date: "24/3/2022");
  // AllTicketsData.insertToTicketDatabase(from: "Cairo", to: "Giza", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 25 , available: 15, date: "1/4/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Cairo", to: "Aswan", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 235 , available: 15, date: "10/4/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Cairo", to: "Alexandria", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 50 , available: 15, date: "10/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Cairo", to: "Giza", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 25 , available: 15, date: "1/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Giza", to: "Cairo", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 25 , available: 15, date: "1/4/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Giza", to: "Alexandria", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 35 , available: 15, date: "21/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Giza", to: "Fayoum", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 40 , available: 15, date: "10/5/2023/");
  // AllTicketsData.insertToTicketDatabase(from: "Giza", to: "Aswan", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 200 , available: 15, date: "24/3/2022");
  // AllTicketsData.insertToTicketDatabase(from: "Giza", to: "Luxor", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 70 , available: 15, date: "1/4/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Giza", to: "Cairo", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 25 , available: 15, date: "18/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Giza", to: "Alexandria", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 35 , available: 15, date: "10/5/2023/");
  // AllTicketsData.insertToTicketDatabase(from: "Alexandria", to: "Giza", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 35 , available: 15, date: "10/5/2023/");
  // AllTicketsData.insertToTicketDatabase(from: "Alexandria", to: "Cairo", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 50 , available: 15, date: "21/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Alexandria", to: "Aswan", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 300 , available: 15, date: "10/5/2023/");
  // AllTicketsData.insertToTicketDatabase(from: "Alexandria", to: "Fayoum", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 100 , available: 15, date: "4/4/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Alexandria", to: "Luxor", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 280 , available: 15, date: "30/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Alexandria", to: "Giza", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 35 , available: 15, date: "24/3/2022");
  // AllTicketsData.insertToTicketDatabase(from: "Alexandria", to: "Cairo", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 50 , available: 15, date: "18/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Fayoum", to: "Cairo", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 30 , available: 15, date: "10/5/2023/");
  // AllTicketsData.insertToTicketDatabase(from: "Fayoum", to: "Giza", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 40 , available: 15, date: "1/5/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Fayoum", to: "Alexandria", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 100 , available: 15, date: "10/5/2023/");
  // AllTicketsData.insertToTicketDatabase(from: "Fayoum", to: "Aswan", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 90 , available: 15, date: "21/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Fayoum", to: "Luxor", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 120 , available: 15, date: "11/4/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Fayoum", to: "Alexandria", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 100 , available: 15, date: "10/5/2023/");
  // AllTicketsData.insertToTicketDatabase(from: "Fayoum", to: "Giza", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 40 , available: 15, date: "10/5/2023/");
  // AllTicketsData.insertToTicketDatabase(from: "Fayoum", to: "Cairo", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 30 , available: 15, date: "10/5/2023/");
  // AllTicketsData.insertToTicketDatabase(from: "Aswan", to: "Cairo", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 235 , available: 15, date: "1/4/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Aswan", to: "Giza", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 200 , available: 15, date: "18/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Aswan", to: "Alexandria", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 300 , available: 15, date: "22/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Aswan", to: "Fayoum", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 90 , available: 15, date: "28/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Aswan", to: "Luxor", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 10 , available: 15, date: "10/5/2023/");
  // AllTicketsData.insertToTicketDatabase(from: "Aswan", to: "Giza", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 200 , available: 15, date: "25/3/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Aswan", to: "Cairo", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 235 , available: 15, date: "2/4/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Luxor", to: "Cairo", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 80 , available: 15, date: "10/5/2023/");
  // AllTicketsData.insertToTicketDatabase(from: "Luxor", to: "Giza", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 70 , available: 15, date: "1/4/2022/");
  // AllTicketsData.insertToTicketDatabase(from: "Luxor", to: "Fayoum", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 120 , available: 15, date: "10/5/2023/");
  // AllTicketsData.insertToTicketDatabase(from: "Luxor", to: "Alexandria", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 280 , available: 15, date: "10/5/2023/");
  // AllTicketsData.insertToTicketDatabase(from: "Luxor", to: "Cairo", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 80 , available: 15, date: "10/5/2023/");
  // AllTicketsData.insertToTicketDatabase(from: "Luxor", to: "Aswan", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 10 , available: 15, date: "10/5/2023/");
  // AllTicketsData.insertToTicketDatabase(from: "Luxor", to: "Cairo", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 80 , available: 15, date: "10/5/2023/");
  // AllTicketsData.insertToTicketDatabase(from: "Luxor", to: "Cairo", typeID: Icons.train.codePoint, type: Icons.train.fontFamily.toString() , price: 80 , available: 15, date: "20/3/2022/");

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
