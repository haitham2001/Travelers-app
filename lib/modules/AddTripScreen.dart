import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travellers/TicketDatabase/TicketDataBase.dart';
import 'package:travellers/components/components.dart';
import 'package:travellers/constants/constants.dart';
import 'package:travellers/modules/admin.dart';

import 'package:travellers/modules/login_screen.dart';
import 'package:travellers/providers/pass_provider.dart';
import 'package:travellers/providers/theme_provider.dart';
import 'package:travellers/registerdatabase/register_data_base.dart';
import 'package:travellers/styles/colors.dart';


class AddTripScreen extends StatefulWidget {
  const AddTripScreen({Key? key}) : super(key: key);

  @override
  _AddTripScreenState createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  var FormKey = GlobalKey<FormState>();
  var fromController = TextEditingController();
  var toController = TextEditingController();
  var priceController = TextEditingController();
  var avaialableController = TextEditingController();
  var dateController = TextEditingController();
  String?tripWayValueChoose;
  String?fromValueChoose;
  String?toalueChoose;

  int? tripTypeId;
  String? tripTypeText;

  List listItem= [
    'Air Plane','Train','Bus'
  ];

  List tripsList= [
    'Egypt','Italy','Russia','Saudi','Libya','France','Spain','China','Palestine','Morocco','Germany',
    'Cairo','Alexandria','Luxor','Aswan','Fayoum','Giza'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Trip',
          style: TextStyle(
            color: Colors.white,
          ),
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
      body: Container(
        decoration: const BoxDecoration(

        ),
        child: Center(
          child: SingleChildScrollView(
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Add Trip',
                style: Theme.of(context).textTheme.headline1,
              ),
              Padding(
                padding: const EdgeInsets.all(38.0),
                child: Form(
                  key: FormKey,
                  child: Column(
                    children: [
                      Container(
                        padding:EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15.5)
                        ),
                        child: DropdownButton(
                            isExpanded: true,
                            hint: Text("select your place",style: Theme.of(context).textTheme.bodyText1,
                            ),
                            dropdownColor: Provider.of<ThemeProvider>(context).isDark ? HexColor('333739') : Colors.white,
                            iconSize: 30,
                            value: fromValueChoose,
                            onChanged: (newValue){
                              setState(() {
                                fromValueChoose=newValue.toString();
                              });
                            },
                            items: tripsList.map((valueItem){
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList()
                        ),
                      ),


                      SizedBox(
                        height: 18.0,
                      ),
                      Container(
                        padding:EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15.5)
                        ),
                        child: DropdownButton(
                            isExpanded: true,
                            hint: Text("select your Destination",style: Theme.of(context).textTheme.bodyText1,),
                            dropdownColor: Provider.of<ThemeProvider>(context).isDark ? HexColor('333739') : Colors.white,
                            iconSize: 30,
                            value: toalueChoose,
                            onChanged: (newValue){
                              setState(() {
                                toalueChoose=newValue.toString();

                              });
                            },
                            items: tripsList.map((valueItem){
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList()
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Container(
                        padding:EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15.5)
                        ),
                        child: DropdownButton(
                            isExpanded: true,
                            hint: Text("select your Transport way",style: Theme.of(context).textTheme.bodyText1,),
                            dropdownColor: Provider.of<ThemeProvider>(context).isDark ? HexColor('333739') : Colors.white,
                            iconSize: 30,
                            value: tripWayValueChoose,
                            onChanged: (newValue){
                              setState(() {
                                tripWayValueChoose=newValue.toString();
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
                        height: 18,
                      ),

                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller:priceController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          labelText: 'Price',
                          labelStyle: Theme.of(context).textTheme.bodyText2,
                          prefixIcon: const Icon(
                            Icons.airplanemode_active_rounded,
                            color: defaultColor,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          suffix: CircleAvatar(
                            radius: 15,
                            backgroundColor: defaultColor,
                            child: GestureDetector(
                              child: const Icon(
                                Icons.clear,
                                color: Colors.white,
                              ),

                              onTap: () {
                                print(priceController.text);

                              },
                            ),
                          ),
                        ),


                      ),
                      SizedBox(
                        height: 18,
                      ),

                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: avaialableController,
                        decoration: InputDecoration(

                          contentPadding: const EdgeInsets.all(8),
                          labelText: 'Available Amount',
                          labelStyle: Theme.of(context).textTheme.bodyText2,
                          prefixIcon: const Icon(
                            Icons.airplanemode_active_rounded,
                            color: defaultColor,
                          ),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          suffix: CircleAvatar(
                            radius: 15,
                            backgroundColor: defaultColor,
                            child: GestureDetector(
                              child: const Icon(
                                Icons.clear,
                                color: Colors.white,
                              ),

                              onTap: () {
                               // avaialableController.clear();
                              },
                            ),
                          ),
                        ),

                      ),
                      SizedBox(
                        height: 18,
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          labelText: 'Date Of Trip',
                          labelStyle: Theme.of(context).textTheme.bodyText2,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          prefixIcon: const Icon(
                            Icons.calendar_today,
                            color: defaultColor,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your Date Of Birth';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.datetime,
                        controller: dateController,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.parse('1990-10-25'),
                            lastDate: DateTime.parse('2022-10-25'),
                          ).then((value) {
                            dateController.text =
                                DateFormat.yMMMd().format(value!);
                          });
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      defaultBtn(
                          txt: 'Add Trip',
                          icon: Icons.add,
                          right_margin_text: 35,
                          function: () async {

                            if(fromValueChoose==null||toalueChoose==null||tripWayValueChoose==null||priceController.text==""||avaialableController.text==""||dateController.text=="")
                              {
                                Fluttertoast.showToast(
                                    msg: 'Please fill all fields');
                              }
                            else {
                              if (tripWayValueChoose.toString() ==
                                  "Air Plane") {
                                tripTypeId =
                                    Icons.airplanemode_active.codePoint;
                                tripTypeText =
                                    Icons.airplanemode_active.fontFamily
                                        .toString();
                              }
                              else
                              if (tripWayValueChoose.toString() == "Train") {
                                tripTypeId = Icons.train.codePoint;
                                tripTypeText =
                                    Icons.train.fontFamily.toString();
                              }
                              else if (tripWayValueChoose.toString() == "Bus") {
                                tripTypeId = Icons.directions_bus.codePoint;
                                tripTypeText =
                                    Icons.directions_bus.fontFamily.toString();
                              }

                              await AllTicketsData.insertToTicketDatabase(
                                  from: fromValueChoose.toString(),
                                  to: toalueChoose.toString(),
                                  typeID: int.parse(tripTypeId.toString()),
                                  type: tripTypeText.toString(),
                                  price: int.parse(priceController.text),
                                  available: int.parse(
                                      avaialableController.text),
                                  date: "30/9/2022");

                              AllTicketsData.getTicketData();
                              Fluttertoast.showToast(
                                  msg: 'Trip Added Successfully');
                               NavigateAndFinish(context, const Admin());
                            }

                          },
                          backgroundcolor: defaultColor),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );

  }
}

