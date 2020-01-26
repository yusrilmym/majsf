import 'package:flutter/material.dart';

 class NotifDivision extends StatefulWidget {
   @override
   _NotifDivisionState createState() => _NotifDivisionState();
 }
 
 class _NotifDivisionState extends State<NotifDivision> {
   var Division_on_notif = [
    {
      "name": "Satu",
      "picture": "images/logo/nalogo.png",
      "quantity": "fdhe354234dsfgfsdf",
      "act_quantity": 7,
    },
    {
      "name": "Dua",
      "picture": "images/logo/nalogo.png",
      "quantity": "dagsdvbxcvsdfsdrfqwerw",
      "act_quantity": 8,
    }
  ];

   @override
   Widget build(BuildContext context) {
     return new ListView.builder(
       itemCount: Division_on_notif.length,
       itemBuilder: (context, index){
         return Single_notif_division(
           notif_div_name: Division_on_notif[index]["name"],
           notif_div_picture: Division_on_notif[index]["picture"],
           notif_div_qty: Division_on_notif[index]["quantity"],
           notif_div_act: Division_on_notif[index]["act_quantity"]
         );
       });
   }
 }

 class Single_notif_division extends StatelessWidget {
  final notif_div_name;
  final notif_div_picture;
  final notif_div_qty;
  final notif_div_act;

  Single_notif_division({
    this.notif_div_name,
    this.notif_div_picture,
    this.notif_div_qty,   
    this.notif_div_act
    });
   @override
   Widget build(BuildContext context) {
     return Card(
       child: ListTile(
         leading: new Image.asset(notif_div_picture, width: 80.0,
         height: 80.0,),
         title: new Text(notif_div_name),
         subtitle: new Column(
           children: <Widget>[
             new Row(
               children: <Widget>[
                 
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: new Text(notif_div_qty),
                 ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                   child: new Text("$notif_div_act"),
                 ),
               ],
             )
           ],
         ),
       ),
     );
   }
 }