import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'detail.dart';
import 'addData.dart';

void main() {
  runApp(MaterialApp(
    title: "RestApi",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  Future<List> getData() async {
    final response =
        await http.get("http://192.168.1.5/apilatihan_flutter/getData.php");
        return json.decode(response.body);      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REST API"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context)=>addData()),
        )
        ),
      body: 
      FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          print(snapshot.data);
          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  ItemList({this.list});
  final List list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext contex) => Detail(
                  list: list, index: i,
                )
                )
                ),
            child: Card(
              child: ListTile(
                title: Text(list[i]['item_name']),
                leading: Icon(Icons.subtitles),
                subtitle: Text("Stock : ${list[i]['stock']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
