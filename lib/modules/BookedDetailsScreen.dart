// ignore: file_names
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travellers/TicketDatabase/TicketDataBase.dart';
import 'package:travellers/components/components.dart';
import 'package:travellers/constants/constants.dart';
import 'package:travellers/modules/DetailsData.dart';
import 'package:travellers/modules/TicketsScreen.dart';
import 'package:travellers/modules/home_screen.dart';
import 'package:travellers/modules/pick_destination.dart';
import 'package:travellers/modules/receipt.dart';
import 'package:travellers/styles/my_flutter_app_icons.dart';
import 'package:travellers/styles/colors.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:travellers/user_data.dart';

import 'DetailsData.dart';

class BookedDetailsScreen extends StatelessWidget {
  //const DetailsScreen({Key? key}) : super(key: key);
  static var quantityControler=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ticket Details",
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Icon( IconData( DetailsData.ticket!.typeId, fontFamily: DetailsData.ticket!.type),size: 100,),
              //Icon(Icons.airplanemode_active,size: 80,),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: defaultColor,width: 2.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      " From :-> "+DetailsData.ticket!.from,
                      style: TextStyle(color: Colors.deepOrange,fontSize: 32),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: defaultColor,width: 2.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      " To :-> "+DetailsData.ticket!.to,
                      style: TextStyle(color: Colors.deepOrange,fontSize: 32),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: defaultColor,width: 2.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children:[
                    Text(
                      " Price :-> "+DetailsData.ticket!.price.toString(),
                      style: TextStyle(color: Colors.deepOrange,fontSize: 32),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: defaultColor,width: 2.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      " Quantity\n ",
                      style: TextStyle(color: Colors.deepOrange,fontSize: 25),
                    ),
                    Text(
                      ":->"+DetailsData.quantity  .toString(),
                      style: TextStyle(color: Colors.deepOrange,fontSize: 32),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),

                    ),
                    defaultBtn(
                      right_margin_icon: 10,
                      right_margin_text: 90,
                      txt: "Home",
                      function: () {
                       navigateTo(context, HomeScreen());
                      },
                      backgroundcolor: defaultColor,
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
}
