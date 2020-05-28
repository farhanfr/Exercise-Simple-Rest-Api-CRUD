import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;
  EditData({this.list,this.index});
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

TextEditingController conCode ;
TextEditingController conName ;
TextEditingController conPrice ;
TextEditingController conStock ;

void EditDataProcess(){
     var url = "http://192.168.1.5/apilatihan_flutter/updateData.php";
     http.post(url,body: {
    "id":widget.list[widget.index]['id'],
    "item_code": conCode.text,
    "itemName": conName.text,
    "price":conPrice.text,
    "stock":conStock.text
     });
}

@override
  void initState() {
    conCode = TextEditingController(text: widget.list[widget.index]['item_code']);
    conName = TextEditingController(text: widget.list[widget.index]['item_name']);
    conPrice = TextEditingController(text: widget.list[widget.index]['price']);
    conStock = TextEditingController(text: widget.list[widget.index]['stock']); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EDIT DATA"),),
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
                    child: Text("Edit data"),
                    color: Colors.amber,
                    onPressed: () {
                      EditDataProcess();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context)=>Home())
                      );
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}