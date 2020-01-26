import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:majsf/component/divisionreplog.dart';
import 'package:majsf/component/divisionreppress.dart';
import 'package:majsf/component/divisionrepweld.dart';
import 'package:majsf/component/horizontal_listview.dart';
import 'package:majsf/component/division.dart';
import 'package:majsf/network/addikan.dart';
import 'package:majsf/pages/login.dart';
import 'package:majsf/pages/notif.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GeneralPage extends StatefulWidget {
  GeneralPage({this.username});
  final String username;
  @override
  _GeneralPageState createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/back.jpg'),
          AssetImage('images/back1.png'),
          AssetImage('images/back2.png'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 2.0,
      ),
    );

    // Widget coba_list = new Container(

    // );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.blue,
        title: Text('General'),
        actions: <Widget>[
          // new IconButton(
          //     icon: Icon(
          //       Icons.search,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Notif()));
              })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            // header
            new UserAccountsDrawerHeader(
              accountName: Text('$username'),
              accountEmail: Text(''),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.blue[800]),
            ),

            // body
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),

            InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => new HomeScreen()));
              },
              child: ListTile(
                title: Text('Problem List'),
                leading: Icon(Icons.report),
              ),
            ),

            InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => new FormAddScreen()));
              },
              child: ListTile(
                title: Text('Quality List'),
                leading: Icon(Icons.layers),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Productivity'),
                leading: Icon(Icons.multiline_chart),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('SHE Area'),
                leading: Icon(Icons.build),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new AddIkan()));
              },
              child: ListTile(
                title: Text('IKAN (Ide PerbaiKAN)'),
                leading: Icon(Icons.thumb_up, color: Colors.green),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.blue),
              ),
            ),

            InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                });
              },
              child: ListTile(
                title: Text('Log out'),
                leading: Icon(
                  Icons.transit_enterexit,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
      body: new Column(
        children: <Widget>[
          //image carousel
 
          //pedding widget
          // new Padding(padding: const EdgeInsets.all(8.0),
          // child: Container(
          //   alignment: Alignment.centerLeft,
          //   body:SingleChildScrollView(
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => ));
          //   scrollDirection: Axis.vertical,
          //   child: new Text('Report Department')),),
          // //Horizontal list view Begins here
          // HorizontalList(),
          //Padding Widget
          new Expanded(
              child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
                       image_carousel,
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text('Report Press'),
                ),
              ),
              Container(
                child: DivisionRepPress(),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: new Text('Report Welding')),
              ),
              //Grid View
              Container(child: DivisionRepWeld()),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: new Text('Report Logistic')),
              ),
              Container(child: DivisionRepLog()),
              //
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: new Text('Other')),
              ),
              Container(child: Division()),
              Container(child: Text(""),),
            ],
          ))
        ],
      ),
    );
  }
}
