import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellers/modules/cubit/cubit.dart';
import 'package:travellers/modules/cubit/states.dart';
import 'package:travellers/modules/cubit/theme_cubit.dart';
import 'package:travellers/modules/login_screen.dart';
import 'package:travellers/modules/on_boarding_screen.dart';
import 'package:travellers/modules/register_screen.dart';
import 'package:travellers/styles/themes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ThemeCubit(),
      child: BlocConsumer<ThemeCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state) =>
          MaterialApp(
          home: OnBoardingScreen(),
            theme: LightMode,
            darkTheme: DarkMode,
            themeMode: ThemeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
        ) ,

      ),

    );

  }
}

