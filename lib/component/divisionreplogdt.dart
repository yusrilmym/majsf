import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DivisionRepLogDt extends StatefulWidget {
  @override
  _DivisionRepLogDtState createState() => _DivisionRepLogDtState();
}

class _DivisionRepLogDtState extends State<DivisionRepLogDt> {
  final yellow = charts.MaterialPalette.yellow.makeShades(2);
  final red = charts.MaterialPalette.red.makeShades(2);
  final green = charts.MaterialPalette.green.makeShades(2);
  @override
  Widget build(BuildContext context) {

    var data = [
      Report("AA-1903", 0.16),
      Report("SC-0976", 2.00),
      Report("AA-0415", 5.59),
      Report("AA-0379", 7.14),
      Report("AA-0377", 7.26),
      Report("SC-0777", 7.64),
      Report("AA-0380", 7.91),
      Report("AA-1904", 11.43),
      Report("AA-0378", 11.84),
      Report("SC-0791", 16.02),
      Report("AA-0402", 17.01),
      Report("SC-0792", 17.03),
      Report("AA-0367", 17.43),
      Report("AA-0406", 19.01),
      Report("SC-0974", 21.70),
      Report("AA-1901", 24.00),
    ];

    var series = [
      charts.Series(
        domainFn: (Report report,_)=>report.strength,
        measureFn: (Report report,_)=>report.stock,
        id: 'Sluuurrrr',
        data: data,
        labelAccessorFn: (Report report,_)=>'${report.stock.toString()}',
        colorFn: (Report report,_){
          if(report.stock<=6){
            return red[1];
          }else if(report.stock>6 && report.stock<=10){
            return green[1];
          }else{
            return yellow[1];
          }
        }
      )
    ];

    var chart = charts.BarChart(
      series,
      vertical: false,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Report Press"),),
      body: Column(
        children: <Widget>[
          Text("Report Rundown Stock IFP", style: TextStyle(fontSize: 25),),
          SizedBox(height: 550, child: chart),
        ],
      ),
    );
  }
}

class Report{
  final String strength;
  final double stock;

  Report(this.strength, this.stock);
}