import 'package:flutter/material.dart';
import 'package:majsf/other/flood.dart';

class Division extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/flood.png',
            image_caption: 'Flood',
            link: Flood(),
          ),
          Category(
            image_location: 'images/box.png',
            image_caption: 'Line A',
          ),
          Category(
            image_location: 'images/box.png',
            image_caption: 'Line B',
          ),
          Category(
            image_location: 'images/box.png',
            image_caption: 'Line C',
          )
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
