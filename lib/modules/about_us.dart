import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:travellers/components/components.dart';
import 'package:travellers/modules/home_screen.dart';
import 'package:travellers/modules/profile_screen.dart';
import 'package:travellers/modules/register_screen.dart';
import 'package:travellers/providers/theme_provider.dart';
import 'package:travellers/styles/colors.dart';
import 'login_screen.dart';


class About extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us',
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
            child: PopupMenuButton<int>(icon: Icon(Icons.more_vert,color: Colors.white,),
              color:defaultColor ,itemBuilder: (context)=>[
                PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(Icons.home, color: Colors.white),
                        Text("Home",style:
                        TextStyle(color: Colors.white)),
                      ],
                    )
                ),
                PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: [
                        Icon(Icons.person, color: Colors.white),
                        Text("Profile",style:
                        TextStyle(color: Colors.white)),
                      ],
                    )
                ),
                PopupMenuDivider(),
                PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: [
                        Icon(Icons.logout,color: Colors.white,),
                        const SizedBox(width: 7,),
                        Text('Logout',style: TextStyle(color: Colors.white),)
                      ],
                    )
                )
              ],onSelected: (item)=>SelectedItem(context,item),),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
            padding: EdgeInsets.all(26.0),

                child: Column(
                  children:[
                const Text("Travelers App has been created by a team of 6 Flutter developers to make your life easier and faster. "
                "It provides you with a flexible booking service that helps you book your ticket(s) to your trip"
                "(whether by air or overland) and have a good time. Before you book the desired trip, you will find "
                "all the information regarding this trip. \n\n"
                "Version:1.0\n",
                  style: TextStyle(fontSize: 18,color: defaultColor,fontWeight: FontWeight.bold),
                ),
                    Row(
                        children: [
                          Icon(Icons.people_alt_rounded,color: defaultColor,)
                          ,  SizedBox(width:7),
                          Text("Our team members are:",style: TextStyle(fontSize: 18,color: defaultColor,fontWeight: FontWeight.bold),)
                        ]
                    ),SizedBox(height: 7,),
                Row(
                    children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/hadi.png",
                  ),radius: 25,
                ),
                    SizedBox(width:7),
                      Text("Hadi Ehab",style: TextStyle(fontSize: 18,color: defaultColor,fontWeight: FontWeight.bold),)
                    ]
                ),
                SizedBox(height:9),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/atef.png",
                      ),radius: 25,
                    ),
                SizedBox(width:7),
                Text("Hadi Atef",style: TextStyle(fontSize: 18,color: defaultColor,fontWeight: FontWeight.bold)),
                    ]
                ),
                SizedBox(height:9),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/waleed.png",
                      ),radius: 25,
                    ),

                SizedBox(width:7),
                Text("Waleed Mohamed",style: TextStyle(fontSize: 18,color: defaultColor,fontWeight: FontWeight.bold)),
                    ]
                ),
                SizedBox(height:9),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/mazen.png",
                      ),radius: 25,
                    ),
                SizedBox(width:7),
                Text("Mazen Mohamed",style: TextStyle(fontSize: 18,color: defaultColor,fontWeight: FontWeight.bold))
                    ]
                ),
                SizedBox(height:9),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/haytham.png",
                      ),radius: 25,
                    ),
                SizedBox(width:7),
                Text("Haitham Mahmoud",style: TextStyle(fontSize: 18,color: defaultColor,fontWeight: FontWeight.bold)),
                    ]
                ),
                SizedBox(height:9),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/sabry.png",
                      ),radius: 25,
                    ),
                    SizedBox(width:7),
                    Text("Muhammad Sabry",style: TextStyle(fontSize: 18,color: defaultColor,fontWeight: FontWeight.bold)),
                        ]
                    ),

                  ],
                )
            )



          ],
        ),
      ),
    );
  }
  SelectedItem(BuildContext context, item) {
    switch(item){
      case 0:
        navigateTo((context), HomeScreen());
        break;
      case 1:
        navigateTo((context),ProfileScreen());
        break;
      case 2:
        NavigateAndFinish(context, LoginScreen());
        break;
    }
  }
}
