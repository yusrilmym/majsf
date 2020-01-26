import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class AddIkan extends StatefulWidget {
  @override
  _AddIkanState createState() => _AddIkanState();
}

class _AddIkanState extends State<AddIkan> {
  TextEditingController controllerNik = new TextEditingController();
  TextEditingController controllerIde = new TextEditingController();

  void addIde() {
    var url = "http://192.168.20.31/pasrah/addikan.php";

    http.post(url, body: {
      "ininik": controllerNik.text,
      "iniide": controllerIde.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Ide Perbaikan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Text(
              "Berikan Ide Terbaik Anda",
              style: TextStyle(fontSize: 25,), textAlign: TextAlign.center,
            ),
            new TextFormField(
              controller: controllerNik,
              decoration:
                  new InputDecoration(hintText: "input NIK", labelText: "NIK"),
            ),
            new TextFormField(
              controller: controllerIde,
              decoration:
                  new InputDecoration(hintText: "Input IDE", labelText: "IDE"),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              child: new Text(
                "Add Ide",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blueAccent,
              onPressed: () {
                addIde();
                Navigator.pop(context);
                Fluttertoast.showToast(
                    msg: "Ide Sudah Diterima. Terima Kasih Banyak",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
            )
          ],
        ),
      ),
    );
  }
}
