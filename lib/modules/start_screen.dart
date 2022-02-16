import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travellers/components/components.dart';
import 'package:travellers/modules/about_us.dart';
import 'package:travellers/modules/login_screen.dart';
import 'package:travellers/modules/register_screen.dart';
import 'package:travellers/providers/theme_provider.dart';
import 'package:travellers/styles/colors.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Travellers',
        ),

        actions: [
          Consumer<ThemeProvider>(
            builder: (context, myProv, _) => IconButton(
              onPressed: () {
                myProv.changeAppMode();
              },
              icon: const Icon(Icons.brightness_4_outlined),
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              margin: const EdgeInsets.only(top: 75),
              child: const Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: defaultColor,
                  child: Icon(
                    Icons.airplanemode_active_outlined,
                    color: Colors.white,
                    size: 135,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 160,
            ),
            Container(
              child: defaultBtn(
                  txt: 'Sign in',
                  icon: Icons.login_outlined,

                  function: () {
                    navigateTo(context, const LoginScreen());
                  }),
            ),
            const SizedBox(
              height: 45,
            ),
            // CircleAvatar(
            //   backgroundImage:
            //     AssetImage('assets/images/waled.png'),
            //     radius: 50,
            //
            // ),

            defaultBtn(
                txt: 'Sign up',
                icon: Icons.app_registration_outlined,
                function: () {
                  navigateTo(context, const RegisterScreen());
                }),
            const SizedBox(
              height: 45,
            ),
            defaultBtn(
                txt: 'About Us',
                icon: Icons.group_outlined,
                function: () {
                  navigateTo(context, AboutUsScreen());
                }),
          ],
        ),
      ),
    );
  }
}
