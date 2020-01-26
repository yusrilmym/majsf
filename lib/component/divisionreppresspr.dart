import 'package:flutter/material.dart';

class DivisionRepPressPr extends StatefulWidget {
  @override
  _DivisionRepPressPrState createState() => _DivisionRepPressPrState();
}

class _DivisionRepPressPrState extends State<DivisionRepPressPr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report Production"),
      ),
      body: Column(
        children: <Widget>[
          Text("STOCK CONTROL CUSTOMER PT. ADM", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: FittedBox(
              child: DataTable(
                columns: [
                  DataColumn(
                      label: Text(
                    "Destination",
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    "Normal",
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    "Kritis",
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    "Bahaya",
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  )),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text("ADM PLANT 1")),
                    DataCell(Text("111")),
                    DataCell(Text("222")),
                    DataCell(Text("333")),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("ADM PLANT 4")),
                    DataCell(Text("444")),
                    DataCell(Text("123")),
                    DataCell(Text("234")),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("ADM PLANT 5")),
                    DataCell(Text("567")),
                    DataCell(Text("456")),
                    DataCell(Text("789")),
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
