import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:majsf/other/detail.dart';

class DivisionRepLogPr extends StatefulWidget {
  @override
  _DivisionRepLogPrState createState() => _DivisionRepLogPrState();
}

class _DivisionRepLogPrState extends State<DivisionRepLogPr> {
  Future<List> getData() async {
    final response = await http.get("http://192.168.20.31/pasrah/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Data Lain")),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () {},
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) =>
                    new Detail(list: list, index: i))),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['nama']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("NIK : ${list[i]['nik']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
