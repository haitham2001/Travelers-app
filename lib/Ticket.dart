import 'package:flutter/material.dart';
class Ticket {
  int id;
  String from;
  String to;
  int typeId;
  String type;
  int price;
  int available;
  String date;

  Ticket({ required this.id, required this.from, required this.to, required this.typeId,required this.type, required this.price, required this.available,required this.date});
}