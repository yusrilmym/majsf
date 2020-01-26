import 'package:flutter/material.dart';
import 'package:majsf/pages/login.dart';
import 'package:majsf/pages/adminpage.dart';
import 'package:majsf/pages/generalpage.dart';
import 'package:majsf/pages/presspage.dart';
import 'package:majsf/pages/pspage.dart';


// void main(){runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Login()
//     )
//   );
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MAJ Smart Factory',
      home: Login(),
      routes: <String, WidgetBuilder>{
        '/AdminPage': (BuildContext context) =>new AdminPage(username: username),
        '/GeneralPage': (BuildContext context) => new GeneralPage(),
        '/PsPage': (BuildContext context) => new PsPage(),
        '/PressPage': (BuildContext context) => new PressPage(),
        '/Login': (BuildContext context) => new Login(),
      },
    );
  }
}