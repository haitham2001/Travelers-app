import 'package:flutter/material.dart';

import 'package:travellers/code/login_screen.dart';
import 'package:travellers/components/components.dart';
import 'package:travellers/modules/pick_destination.dart';
import 'package:travellers/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:travellers/styles/colors.dart';
import 'package:travellers/code/profile.dart';
import 'package:travellers/styles/my_flutter_app_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
        ),
        backgroundColor: Colors.deepOrange,
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
              iconTheme: IconThemeData(color: Colors.white),
              dividerColor: Colors.white,

            ),
            child: PopupMenuButton<int>(
                color: defaultColor,
                onSelected: (item) => selected(context,item),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: [
                          Icon(Icons.person, color: Colors.white),
                          Text(
                            "Profile",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ],
                      )
                  ),
                  PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(Icons.group_outlined, color: Colors.white),
                          Text(
                            "About Us",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      )
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: Colors.white),
                        SizedBox(width: 7),
                        Text(
                          "Log Out",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
            ),
          )
        ],
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(
                    .0,
                    .0,
                    .0,
                    70.0
                ),
                child: Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                  15.0,//left
                  45.0,//top
                  15.0,//right
                  45.0,//bottom
                ),
                child: Column(
                  children: [
                    //SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: (){
                        NavigateTo(context, PickDestination());
                      },
                      child: Row(
                        children: [
                          Icon(MyFlutterApp.tickets_ticket_svgrepo_com,size: 52,),
                          SizedBox(width: 10,),
                          Text(
                            "Your Tickets",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    ElevatedButton(
                      onPressed: (){
                        NavigateTo(context, PickDestination());
                      },
                      child: Row(
                        children: [
                          Icon(Icons.airplanemode_active_outlined,size: 52,),
                          SizedBox(width: 15,),
                          Text(
                            "Plane",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    ElevatedButton(
                      onPressed: (){
                        NavigateTo(context, PickDestination());
                      },
                      child: Row(
                        children: [
                          Icon(Icons.directions_bus_rounded, size: 52,),
                          SizedBox(width: 15,),
                          Text(
                            "Bus",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    ElevatedButton(
                      onPressed: (){
                        NavigateTo(context, PickDestination());
                      },
                      child: Row(
                        children: [
                          Icon(Icons.directions_train_sharp,size: 52,),
                          SizedBox(width: 15,),
                          Text(
                            "Train",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void selected(BuildContext context,int selected_item)
  {
    switch(selected_item){
      case 0:
        //Will go to Profile page
        NavigateTo(context, Profile());
        break;
      case 1:
        //Will go to The History Page
        NavigateTo(context, PickDestination()); //Only for testing
        break;
      case 2:
        //Return to login page and delete the stack of pages
        NavigateAndFinish(context, LoginScreen());
        break;
    }
  }
}