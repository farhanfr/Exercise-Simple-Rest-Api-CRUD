import 'package:flutter/material.dart';
import 'package:latihan_restapi/main.dart';
import 'editData.dart';
import 'package:http/http.dart' as http;
import 'main.dart';


class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.list,this.index});

  @override
  _DetailState createState() => _DetailState();
}


class _DetailState extends State<Detail> {

void deleteData(){
   var url = "http://192.168.1.5/apilatihan_flutter/deleteData.php";
   http.post(url,body: {
     'id':widget.list[widget.index]['id']
   });
}

void confirm(){
  AlertDialog alertDialog = AlertDialog(
    content: Text("Are you sure to delete '${widget.list[widget.index]['item_name']}'"),
    actions: <Widget>[
      RaisedButton(
        child: Text("Ok delete"),
        color: Colors.red ,
        onPressed: (){
          deleteData();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context)=>Home(),
          )
          );
        },
        ),
        RaisedButton(
        child: Text("Cancel"),
        color: Colors.green,
        onPressed: ()=>Navigator.pop(context),
        ),
    ],
  );
  showDialog(context: context,child: alertDialog);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.list[widget.index]['item_name']}"),),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(widget.list[widget.index]['item_name'],style: TextStyle(fontSize: 20.0),),
                Text("code : ${widget.list[widget.index]['item_code']}",style: TextStyle(fontSize: 18.0),),
                Text("harga :${widget.list[widget.index]['price']}",style: TextStyle(fontSize: 20.0),),
                Text("Stock :${widget.list[widget.index]['stock']}",style: TextStyle(fontSize: 20.0),),
                Padding(padding: EdgeInsets.only(top: 30.0),),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                        child: Text("Delete"),
                        color: Colors.red,
                      onPressed:()=>confirm(),
                    ),
                     RaisedButton(
                        child: Text("Edit"),
                        color: Colors.green,
                      onPressed:()=>Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context)=>EditData(list: widget.list,index: widget.index,),
                        )
                      ), 
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}