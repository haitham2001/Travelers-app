// ignore: file_names
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travellers/TicketDatabase/TicketDataBase.dart';
import 'package:travellers/components/components.dart';
import 'package:travellers/constants/constants.dart';
import 'package:travellers/modules/DetailsData.dart';
import 'package:travellers/modules/TicketsScreen.dart';
import 'package:travellers/modules/pick_destination.dart';
import 'package:travellers/modules/receipt.dart';
import 'package:travellers/styles/my_flutter_app_icons.dart';
import 'package:travellers/styles/colors.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:travellers/user_data.dart';

import 'DetailsData.dart';

class DetailsScreen extends StatelessWidget {
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
                          " Available \n tickets",
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
                          child: NumberInputPrefabbed.roundedEdgeButtons(
                            controller: quantityControler,
                            initialValue: 1,
                            scaleWidth: 1,
                            min: 0,
                            //max: Number of available tickets from database,
                            incDecBgColor: Colors.deepOrange,
                            buttonArrangement: ButtonArrangement.incRightDecLeft,
                          ),
                        ),
                        defaultBtn(
                          right_margin_icon: 10,
                          right_margin_text: 45,
                          txt: "Order",
                          icon: Icons.bookmark_border,
                          function: () {
                            if(int.parse(quantityControler.text)>0&&int.parse(quantityControler.text)<DetailsData.ticket!.available) {
                              AllTicketsData.insertToBookedTicketDatabase(
                                  userId: UserData.LoggedUser.id,
                                  ticketID: DetailsData.ticket!.id,
                                  quantity: int.parse(quantityControler.text));
                              AllTicketsData.updateBookedDatabase(DetailsData.ticket!.from,DetailsData.ticket!.to,DetailsData.ticket!.typeId,DetailsData.ticket!.type,DetailsData.ticket!.price,(DetailsData.ticket!.available-int.parse(DetailsScreen.quantityControler.text)),DetailsData.ticket!.date, DetailsData.ticket!.id);
                              Fluttertoast.showToast(
                                  msg: 'Trip Booked Successfully  '+UserData.LoggedUser.id.toString());
                              NavigateAndFinish(context, const Receipt());
                              bookedTicketsData.clear();
                              ticketsData.clear();
                              AllTicketsData.getBookedTicketData();
                              AllTicketsData.getTicketData();
                              //Will Take you to Reciept
                            }
                            else
                              {
                                Fluttertoast.showToast(
                                    msg: 'Invalid Quantity');
                              }
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
