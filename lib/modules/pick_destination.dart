import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:travellers/modules/login_screen.dart';
import 'package:travellers/modules/profile_screen.dart';
import 'package:travellers/providers/theme_provider.dart';
import 'package:page_transition/page_transition.dart';

import 'package:travellers/components/components.dart';

import 'package:travellers/modules/register_screen.dart';
import 'package:travellers/styles/colors.dart';

class PickDestination extends StatelessWidget {
  const PickDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Destination',
            style: TextStyle(color: Colors.white),
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
              data: Theme.of(context).copyWith(dividerColor: Colors.white),
              child: PopupMenuButton<int>(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                color: defaultColor,
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: const [
                          Icon(Icons.person, color: Colors.white),
                          Text("Profile",
                              style: TextStyle(color: Colors.white)),
                        ],
                      )),
                  PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(Icons.group_outlined, color: Colors.white),
                          Text("About Us",
                              style: TextStyle(color: Colors.white)),
                        ],
                      )),
                  PopupMenuDivider(),
                  PopupMenuItem<int>(
                      value: 2,
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ))
                ],
                onSelected: (item) => SelectedItem(context, item),
              ),
            )
          ],
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(26.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Where are you going?',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 7.0,
              ),
              Text(
                'From',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Source',
                  labelStyle: Theme.of(context).textTheme.bodyText2,
                  prefixIcon: Icon(
                    Icons.flight_takeoff,
                    color: defaultColor,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 23.0,
              ),
              Text(
                'To',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Destination',
                  labelStyle: Theme.of(context).textTheme.bodyText2,
                  prefixIcon: Icon(
                    Icons.flight_land,
                    color: defaultColor,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 23.0,
              ),
              defaultBtn(
                txt: 'Find My Trip',
                function: () {},
                backgroundcolor: defaultColor,
              ),
              SizedBox(
                height: 10.0,
              ),
              defaultBtn(
                txt: 'Show All Trips',
                function: () {},
                backgroundcolor: defaultColor,
              ),
            ]),
          )
        ]))));
  }

  SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        navigateTo(context, ProfileScreen());
        break;
      case 1:
        print("About Us Clicked");
        break;
      case 2:
        NavigateAndFinish(context, LoginScreen());
        break;
    }
  }
}
