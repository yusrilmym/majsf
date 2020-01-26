import 'package:flutter/material.dart';

class DivisionDetails extends StatefulWidget {
  final division_detail_name;
  final division_detail_quantity;
  final division_detail_actqty;
  final division_detail_picture;

  DivisionDetails({
    this.division_detail_name,
    this.division_detail_quantity,
    this.division_detail_actqty,
    this.division_detail_picture 
  });

  @override
  _DivisionDetailsState createState() => _DivisionDetailsState();
}

class _DivisionDetailsState extends State<DivisionDetails> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.blue,
        title: InkWell(
          onTap: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>new HomePage()));
            },
          child: Text("General")
        ),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.search, 
              color: Colors.white,
              ), 
              onPressed: (){}),
        ],
      ),

      body: new ListView(
        children: <Widget>[
          new Container(
            height: 150.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.division_detail_picture),
              ),
            footer: new Container(
              color: Colors.white70,
              child: ListTile(
                leading: new Text(widget.division_detail_name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
              ),
            ),),
          ),
          
          //First Button
          Row(
            children: <Widget>[
              //Size Sementara
              Expanded(
                child: MaterialButton(onPressed: (){
                  showDialog(context: context,
                  builder: (context){
                    return new AlertDialog(
                      title: new Text("Apa"),
                      content: new Text("Pilih Apa?"),
                      actions: <Widget>[
                        new MaterialButton(onPressed: (){
                          Navigator.of(context).pop(context);
                        },
                        textColor: Colors.blue,
                        child: new Text("close"),)
                      ],
                    );
                  });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("Apa")
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down)
                    )
                  ],
                ),),
              ),
              //dua
              Expanded(
                child: MaterialButton(onPressed: (){
                  showDialog(context: context,
                  builder: (context){
                    return new AlertDialog(
                      title: new Text("Cobah"),
                      content: new Text("Pilih Apa?"),
                      actions: <Widget>[
                        new MaterialButton(onPressed: (){
                          Navigator.of(context).pop(context);
                        },
                        textColor: Colors.blue,
                        child: new Text("close"),)
                      ],
                    );
                  });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("Coba")
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down)
                    )
                  ],
                ),),
              ),
              //tiga
              Expanded(
                child: MaterialButton(onPressed: (){
                  showDialog(context: context,
                  builder: (context){
                    return new AlertDialog(
                      title: new Text("Apa"),
                      content: new Text("Pilih Apa?"),
                      actions: <Widget>[
                        new MaterialButton(onPressed: (){
                          Navigator.of(context).pop(context);
                        },
                        textColor: Colors.blue,
                        child: new Text("close"),)
                      ],
                    );
                  });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("Test")
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down)
                    )
                  ],
                ),),
              ),
            ],
          ),
                   //First Button
          Row(
            children: <Widget>[
              //Size Sementara
              Expanded(
                child: MaterialButton(onPressed: (){},
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 0.2,
                child: new Text("Coba ini")
                ),
              ),

              new IconButton(icon: Icon(Icons.add_alarm,
              color: Colors.blue),
              onPressed: (){},),
              new IconButton(icon: Icon(Icons.favorite_border,
              color: Colors.red),
              onPressed: (){},)
            ],
          ),

          Divider(),
          new ListTile(
            title: new Text("Problem List"),
            subtitle: new Text("- Ini"),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text("Nama Departemen", style: TextStyle(color: Colors.blue),),),
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text(widget.division_detail_name),)
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text("Nama Divisi", style: TextStyle(color: Colors.blue),),),
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text("Nyoba"),)
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text("Nama Foreman", style: TextStyle(color: Colors.blue),),),
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text("Nyoba"),)
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text("Nama Operator", style: TextStyle(color: Colors.blue),),),
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text("Nyoba"),)
            ],
          ),
        ],
      ),
    );
  }
}