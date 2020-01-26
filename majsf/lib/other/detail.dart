import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:majsf/main.dart';
import 'package:majsf/pages/generalpage.dart';

class Detail extends StatefulWidget {
  List list;
  int index;

  Detail({this.index,this.list});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  void deleteData(){
    var url="http://192.168.20.31/pasrah/deletedata.php";
    http.post(url, body: {
      'iniid': widget.list[widget.index]['id_employee']
    });
  }

  void confirm(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are you sure want to delete '${widget.list[widget.index]['nama']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("OK DELETE !", style: new TextStyle(color: Colors.black),),
          color: Colors.red,
          onPressed: (){
            deleteData();
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=> new GeneralPage(),
                )
            );
          },
        ),
        new RaisedButton(
          child: new Text("Cencel !"),
          color: Colors.green,
          onPressed: ()=>Navigator.pop(context),
        )
      ],
    );

    showDialog(context: context, child: alertDialog);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['dept']}")),
      body: new Container(
        height: 250.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(children: <Widget>[

              new Padding(padding: const EdgeInsets.only(top: 30.0),),
              new Text(widget.list[widget.index]['nama'], style: new TextStyle(fontSize: 20.0),),
              new Text("NIK : ${widget.list[widget.index]['nik']}", style: new TextStyle(fontSize: 18.0),),
              new Text("Departemen : ${widget.list[widget.index]['dept']}", style: new TextStyle(fontSize: 16.0),),
              new Text("JABATAN : ${widget.list[widget.index]['jabatan']}", style: new TextStyle(fontSize: 16.0),),
              new Padding(padding: const EdgeInsets.only(top: 30.0),),

              new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //  new RaisedButton(
                  //    child: new Text("EDIT"),
                  //    color: Colors.green,
                  //    onPressed: ()=>Navigator.of(context).push(
                  //      new MaterialPageRoute(
                  //        builder: (BuildContext context)=>new EditData(list: widget.list, index: widget.index,),
                  //      )
                  //    ),
                  //  ),
                   new RaisedButton(
                     child: new Text("DELETE"),
                     color: Colors.red,
                     onPressed: ()=>confirm(),
                   )
                ],
              )
            ],),
          ),
        ),
      ),
    );
  }
}