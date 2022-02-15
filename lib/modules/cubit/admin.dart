import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:travellers/providers/theme_provider.dart';
import 'package:page_transition/page_transition.dart';

import 'package:travellers/components/components.dart';

import 'package:travellers/modules/register_screen.dart';
import 'package:travellers/styles/colors.dart';



class Admin extends StatelessWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              title: Text(
                'Admin',
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
                      ElevatedButton(onPressed: (){},
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
                      ElevatedButton(onPressed: (){},
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
}




