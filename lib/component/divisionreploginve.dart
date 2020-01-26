import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DivisionRepLogInve extends StatefulWidget {
  @override
  _DivisionRepLogInveState createState() => _DivisionRepLogInveState();
}

class _DivisionRepLogInveState extends State<DivisionRepLogInve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report Production"),
      ),
      body: Column(
        children: <Widget>[
          Text("STOCK CONTROL CUSTOMER PT. ADM",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: FittedBox(
              child: DataTable(
                columns: [
                  DataColumn(
                      label: Text(
                    "",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                    label: RaisedButton(
                      child: Text(
                        "Normal",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      color: Colors.green,
                      onPressed: () {},
                    ),
                  ),
                  DataColumn(
                      label: RaisedButton(
                    child: Text(
                      "Kritis",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.yellow,
                    onPressed: () {},
                  )),
                  DataColumn(
                      label: RaisedButton(
                    child: Text(
                      "Bahaya",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.red,
                    onPressed: () {},
                  )),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text("ADM PLANT 1")),
                    DataCell(RaisedButton(
                      child: Text("44"),
                      onPressed: _normsalaunchURL,
                    )),
                    DataCell(RaisedButton(
                      child: Text("0"),
                      onPressed: () {},
                    )),
                    DataCell(RaisedButton(
                      child: Text("0"),
                      onPressed: () {},
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("ADM PLANT 4")),
                    DataCell(RaisedButton(
                      child: Text("131"),
                      onPressed: _normdulaunchURL,
                    )),
                    DataCell(RaisedButton(
                      child: Text("2"),
                      onPressed: () {},
                    )),
                    DataCell(RaisedButton(
                      child: Text("21"),
                      onPressed: () {},
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("ADM PLANT 5")),
                    DataCell(RaisedButton(
                      child: Text("55"),
                      onPressed: () {},
                    )),
                    DataCell(RaisedButton(
                      child: Text("1"),
                      onPressed: () {},
                    )),
                    DataCell(RaisedButton(
                      child: Text("1"),
                      onPressed: () {},
                    )),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_normsalaunchURL() async {
  const url =
      "http://192.168.10.229/templateRundown/index.php/Dashboard/report7.maj";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_normdulaunchURL() async {
  const url =
      "http://192.168.10.229/templateRundown/index.php/Dashboard/report8.maj";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
