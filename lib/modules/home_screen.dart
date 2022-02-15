import 'package:flutter/material.dart';

import 'package:travellers/components/components.dart';
import 'package:travellers/modules/login_screen.dart';
import 'package:travellers/modules/pick_destination.dart';
import 'package:travellers/modules/profile_screen.dart';
import 'package:travellers/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:travellers/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
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
          Theme(
            data: Theme.of(context).copyWith(
              iconTheme: const IconThemeData(color: Colors.white),
              dividerColor: Colors.white,
            ),
            child: PopupMenuButton<int>(
                color: defaultColor,
                onSelected: (item) => selected(context, item),
                itemBuilder: (context) => [
                      PopupMenuItem<int>(
                          value: 0,
                          child: Row(
                            children: const [
                              Icon(Icons.person, color: Colors.white),
                              Text(
                                "Profile",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                      PopupMenuItem<int>(
                          value: 1,
                          child: Row(
                            children: const [
                              Icon(Icons.group_outlined, color: Colors.white),
                              Text(
                                "About Us",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                      const PopupMenuDivider(),
                      PopupMenuItem<int>(
                        value: 2,
                        child: Row(
                          children: const [
                            Icon(Icons.logout, color: Colors.white),
                            SizedBox(width: 7),
                            Text(
                              "Log Out",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ]),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // margin: EdgeInsets.only(left: 50),

                padding: const EdgeInsets.fromLTRB(.0, .0, .0, 70.0),
                child: Text(
                  "Available Ways",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(
                  15.0, //left
                  65.0, //top
                  15.0, //right
                  0.0, //bottom
                ),
                child: Column(
                  children: [
                    defaultBtn(
                        txt: 'Tickets',
                        // fontSize: 15,
                        function: () {},
                        icon: Icons.receipt),
                    const SizedBox(
                      height: 45,
                    ),
                    defaultBtn(
                        txt: 'Plane',
                        function: ()
                        {

                        },
                        icon: Icons.airplanemode_active_outlined),
                    const SizedBox(
                      height: 45,
                    ),
                    defaultBtn(
                        txt: 'Bus',
                        function: ()
                        {

                        },
                        icon: Icons.directions_bus),
                    const SizedBox(
                      height: 45,
                    ),
                    defaultBtn(
                        txt: 'Train', function: () {}, icon: Icons.train),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selected(BuildContext context, int selected_item) {
    switch (selected_item) {
      case 0:
        //Will go to Profile page
        navigateTo(context, ProfileScreen());
        break;
      case 1:
        //Will go to The History Page
        navigateTo(context, PickDestination()); //Only for testing
        break;
      case 2:
        //Return to login page and delete the stack of pages
        NavigateAndFinish(context, LoginScreen());
        break;
    }
  }
}
