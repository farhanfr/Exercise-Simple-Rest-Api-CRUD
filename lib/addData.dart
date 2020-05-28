import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class addData extends StatefulWidget {
  @override
  _addDataState createState() => _addDataState();
}

class _addDataState extends State<addData> {

TextEditingController conCode = TextEditingController();
TextEditingController conName = TextEditingController();
TextEditingController conPrice = TextEditingController();
TextEditingController conStock = TextEditingController();

void addDataProcess(){
    var url = "http://192.168.1.5/apilatihan_flutter/addData.php";
  http.post(url,body:{
    "item_code": conCode.text,
    "itemName": conName.text,
    "price":conPrice.text,
    "stock":conStock.text
  });
  
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add data")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                TextField(
                  controller: conCode,
                  decoration: InputDecoration(
                      hintText: "Item code", labelText: "Item code"),
                ),
                TextField(
                  controller: conName,
                  decoration: InputDecoration(
                      hintText: "Item name", labelText: "Item name"),
                ),
                TextField(
                  controller: conPrice,
                  decoration:
                      InputDecoration(hintText: "price", labelText: "price"),
                ),
                TextField(
                  controller: conStock,
                  decoration:
                      InputDecoration(hintText: "stock", labelText: "stock"),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                RaisedButton(
                    child: Text("Add data"),
                    color: Colors.amber,
                    onPressed: () {
                      addDataProcess();
                      Navigator.pop(context,true);
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
