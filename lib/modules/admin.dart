import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:travellers/constants/constants.dart';
import 'package:travellers/modules/AddTripScreen.dart';
import 'package:travellers/modules/DetailsData.dart';
import 'package:travellers/modules/TicketsScreen.dart';
import 'package:travellers/modules/profile_screen.dart';
import 'package:travellers/providers/theme_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travellers/components/components.dart';

import 'package:travellers/modules/register_screen.dart';
import 'package:travellers/styles/colors.dart';

import 'about_us.dart';
import 'login_screen.dart';



class Admin extends StatelessWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admin",
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
                color: Provider.of<ThemeProvider>(context).isDark ? HexColor('333739') : defaultColor,
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
                children: [Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    children: [
                      Text("Welcome",
                      style: Theme.of(context).textTheme.bodyText1),
                      SizedBox(height:15),
                      Icon(Icons.admin_panel_settings,size: 200,color: defaultColor,),
                      SizedBox(height:15),
                      ElevatedButton(onPressed: (){
                        navigateTo(context, AddTripScreen());
                      },
                          child: Row(
                          children: [
                            Icon(Icons.add_circle,size: 52,),
                            SizedBox(width:7.0),
                            Text("Add Trip"
                              ,style: TextStyle(fontSize: 30),)
                          ],
                      )
                      ),
                      SizedBox(height:15),
                      ElevatedButton(onPressed: (){
                        DetailsData.tickets=ticketsData;
                        navigateTo(context, TicketsScreen());
                      },
                          child: Row(
                            children: [
                              Icon(Icons.list_alt,size: 52,),
                              SizedBox(width:7.0),
                              Text("Show All Trips"
                              ,style: TextStyle(fontSize: 30),)
                            ],
                          )
                      ),SizedBox(height:15),
                    ],
                  ),
                ),]
              ),
            ),
          ),

    );
  }
  void selected(BuildContext context, int selected_item) {
    switch (selected_item) {
      case 0:
      //Will go to Profile page
        //navigateTo(context, ProfileScreen());
        break;
      case 1:
      //Will go to The History Page
        navigateTo(context, AboutUsScreen()); //Only for testing
        break;
      case 2:
      //Return to login page and delete the stack of pages
        NavigateAndFinish(context, LoginScreen());
        break;
    }
  }
}




