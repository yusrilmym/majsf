import 'package:flutter/material.dart';
import 'package:majsf/component/divisionreplogdt.dart';
import 'package:majsf/component/divisionreploginve.dart';
import 'package:majsf/component/divisionreplogpr.dart';

class DivisionRepLog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/builder.png',
            image_caption: 'Production',
          ),
          Category(
            image_location: 'images/factory.png',
            image_caption: 'Inventory',
            link: DivisionRepLogInve(),
          ),
          Category(
            image_location: 'images/trolley.png',
            image_caption: 'Stock',
            link: DivisionRepLogDt(),
          ),
          Category(
            image_location: 'images/website.png',
            image_caption: 'Others',
            link: DivisionRepLogPr(),
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  final link;

  Category({this.image_location, this.image_caption, this.link});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => link));
        },
        child: Container(
          width: 90.0,
          child: ListTile(
              title: Image.asset(
                image_location,
                width: 80.0,
                height: 90.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  image_caption,
                  style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),
                ),
              )),
        ),
      ),
    );
  }
}
