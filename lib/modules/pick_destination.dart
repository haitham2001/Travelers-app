import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:travellers/Ticket.dart';
import 'package:travellers/TicketDatabase/TicketDataBase.dart';
import 'package:travellers/constants/constants.dart';
import 'package:travellers/modules/TicketsScreen.dart';
import 'package:travellers/modules/home_screen.dart';
import 'package:travellers/modules/login_screen.dart';
import 'package:travellers/modules/profile_screen.dart';
import 'package:travellers/providers/theme_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travellers/login_screen.dart';
import 'package:travellers/profile.dart';
import 'package:travellers/components/components.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travellers/modules/register_screen.dart';
import 'package:travellers/styles/colors.dart';

import 'DetailsData.dart';
import 'about_us.dart';


class PickDestination extends StatefulWidget {
  static String? from;
  static String? to;

  //const PickDestination({Key? key}) : super(key: key);

  @override
  PickDestinationState createState() => PickDestinationState();
}

class PickDestinationState extends State<PickDestination> {
    List<Ticket> current=[];
   String? valueChoose1;
   String? valueChoose2;
  List listItem= [
    'Egypt','Italy','Russia','Saudi','Libya','France','Spain','China','Palestine','Morocco','Germany',
    'Cairo','Alexandria','Luxor','Aswan','Fayoum','Giza'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Destination',
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
              data: Theme.of(context).copyWith(
                  dividerColor: Colors.white
              ),
              child: PopupMenuButton<int>(icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
                color: Provider.of<ThemeProvider>(context).isDark ? HexColor('333739') : defaultColor ,itemBuilder: (context)=>[
                  PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: [
                          Icon(Icons.person, color: Colors.white),
                          Text("Profile",style:
                          TextStyle(color: Colors.white)),
                        ],
                      )
                  ),
                  PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(Icons.group_outlined, color: Colors.white),
                          Text("About Us",style:
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

        body:Center(
            child:SingleChildScrollView(
                child:Column(
                    children:[
                      Padding(
                        padding: const EdgeInsets.all(26.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Text(
                                'Where are you going?',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              SizedBox(height:7.0,),
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
                              Container(
                                padding:EdgeInsets.only(left: 10,right: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.deepOrange),
                                  borderRadius: BorderRadius.circular(15.5)
                                ),
                                child: DropdownButton(
                                  isExpanded: true,
                                  hint: Text("select your place",style: TextStyle(
                                    color: defaultColor,fontSize: 20
                                  ),),
                                  dropdownColor: Provider.of<ThemeProvider>(context).isDark ? HexColor('333739') : Colors.white,
                                  iconSize: 30,
                                  value: valueChoose1,
                                  onChanged: (newValue){
                                    setState(() {
                                      valueChoose1=newValue.toString();
                                      PickDestination.from=valueChoose1;
                                    });
                                  },
                                 items: listItem.map((valueItem){
                                   return DropdownMenuItem(
                                     value: valueItem,
                                     child: Text(valueItem),
                                   );
                                 }).toList()
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
                              Container(
                                padding:EdgeInsets.only(left: 10,right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.deepOrange),
                                    borderRadius: BorderRadius.circular(15.5)
                                ),
                                child: DropdownButton(
                                    isExpanded: true,
                                    hint: Text("select your Destination",style: TextStyle(
                                        color: Colors.deepOrange,fontSize: 20
                                    ),),
                                    dropdownColor: Provider.of<ThemeProvider>(context).isDark ? HexColor('333739') : Colors.white,
                                    iconSize: 30,
                                    value: valueChoose2,
                                    onChanged: (newValue){
                                      setState(() {
                                        valueChoose2=newValue.toString();
                                        PickDestination.to=valueChoose2;
                                      });
                                    },
                                    items: listItem.map((valueItem){
                                      return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem),
                                      );
                                    }).toList()
                                ),
                              ),
                              SizedBox(
                                height: 33.0,
                              ),
                              defaultBtn(
                                right_margin_icon: 10,
                                right_margin_text: 50,
                                txt: 'Find My Trip',
                                icon: Icons.find_in_page,
                                function: () {
                                  if(valueChoose1==null || valueChoose2==null)
                                    {
                                      Fluttertoast.showToast(
                                          msg: 'please choose your place and destination');
                                    }
                                  else
                                    {
                                  current.clear();
                                  if(HomeScreen.airplane==true)
                                  {
                                    for (int i=0;i<ticketsData.length;i++)
                                      {
                                        if(ticketsData[i].typeId==Icons.airplanemode_active.codePoint&&ticketsData[i].from==PickDestination.from&&ticketsData[i].to==PickDestination.to) {
                                          current.add(ticketsData[i]);
                                        }
                                      }
                                  }
                                  else if(HomeScreen.train==true)
                                  {
                                    for (int i=0;i<ticketsData.length;i++)
                                    {
                                      if(ticketsData[i].typeId==Icons.train.codePoint&&ticketsData[i].from==PickDestination.from&&ticketsData[i].to==PickDestination.to) {
                                        current.add(ticketsData[i]);
                                      }
                                    }
                                  }
                                  else if(HomeScreen.bus==true)
                                  {
                                    for (int i=0;i<ticketsData.length;i++)
                                    {
                                      if(ticketsData[i].typeId==Icons.directions_bus.codePoint&&ticketsData[i].from==PickDestination.from&&ticketsData[i].to==PickDestination.to) {
                                        current.add(ticketsData[i]);
                                      }
                                    }
                                  }

                                  DetailsData.tickets=current;
                                  navigateTo(context, TicketsScreen());

                                }
                                backgroundcolor: defaultColor;
    },
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              defaultBtn(
                                right_margin_icon: 0,
                                right_margin_text: 10,
                                icon: Icons.find_in_page_outlined,
                                txt: 'Show All Trips',
                                function: () {
                                  current.clear();
                                  if(HomeScreen.airplane==true)
                                  {
                                    for (int i=0;i<ticketsData.length;i++)
                                    {
                                      if(ticketsData[i].typeId==Icons.airplanemode_active.codePoint) {
                                        current.add(ticketsData[i]);
                                      }
                                    }

                                  }
                                  else if(HomeScreen.train==true)
                                  {
                                    for (int i=0;i<ticketsData.length;i++)
                                    {
                                      if(ticketsData[i].typeId==Icons.train.codePoint) {
                                        current.add(ticketsData[i]);
                                      }
                                    }
                                  }
                                  else if(HomeScreen.bus==true)
                                  {
                                    for (int i=0;i<ticketsData.length;i++)
                                    {
                                      if(ticketsData[i].typeId==Icons.directions_bus.codePoint) {
                                        current.add(ticketsData[i]);
                                      }
                                    }
                                  }
                                  DetailsData.tickets=current;
                                  navigateTo(context, TicketsScreen());
                                },
                                backgroundcolor: defaultColor,
                              ),
                            ]
                        ),
                      )
                    ]
                )
            )
        )
    );

  }
}


  SelectedItem(BuildContext context, item) {
    switch(item){
      case 0:
        navigateTo(context, ProfileScreen());
        break;
      case 1:
        navigateTo(context,AboutUsScreen());
        break;
      case 2:
        NavigateAndFinish(context, LoginScreen());
        break;
    }
  }

