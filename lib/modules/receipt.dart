import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travellers/modules/DetailsScreen.dart';
import 'package:travellers/modules/TicketsScreen.dart';
import 'package:travellers/modules/home_screen.dart';
import 'package:travellers/styles/colors.dart';
import 'package:travellers/components/components.dart';

import 'DetailsData.dart';

class Receipt extends StatelessWidget {
  const Receipt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Receipt"
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(
            12,
            20,
            12,
            0
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  " From : "+ DetailsData.ticket!.from,

                  style: TextStyle(color: Colors.deepOrange,fontSize: 32),
                ),
              ],
            ),
            SizedBox(height: 17,),
            Row(
              children: [
                Text(
                  " To : "+DetailsData.ticket!.to,
                  style: TextStyle(color: Colors.deepOrange,fontSize: 32),
                ),
              ],
            ),
            SizedBox(height: 17,),
            Row(
              children: [
                Text(
                  " Date : "+DetailsData.ticket!.date,
                  style: TextStyle(color: Colors.deepOrange,fontSize: 32),
                ),
              ],
            ),
            SizedBox(height: 23,),
            Container(
              padding: EdgeInsets.fromLTRB(
                20,
                20,
                20,
                20
              ),
              decoration: BoxDecoration(
                border: Border.all(color: defaultColor,width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Price :"+DetailsData.ticket!.price.toString(),
                        style: TextStyle(color: Colors.deepOrange,fontSize: 25),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        "No. of Tickets :"+DetailsScreen.quantityControler.text,
                        style: TextStyle(color: Colors.deepOrange,fontSize: 25),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        "Total Price:"+(int.parse(DetailsScreen.quantityControler.text)*DetailsData.ticket!.price).toString(),
                        style: TextStyle(color: Colors.deepOrange,fontSize: 25),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            defaultBtn(
              right_margin_text: 45,
              icon: Icons.home,
                txt: 'Home',
                function: (){
              NavigateAndFinish(context, HomeScreen());
                }),
          ],
        ),
      ),
    );
  }
}
