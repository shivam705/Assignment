import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: DataFromAPI(),
    );
  }
}

class DataFromAPI extends StatefulWidget {
  const DataFromAPI({Key? key}) : super(key: key);

  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {
   List a=[];

  @override
  Widget build(BuildContext context) {
    getUserData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Listexample'),
      ),
      body: ListView.builder(itemCount: a.length,itemBuilder: (context, i){
        return Card(
          margin: EdgeInsets.all(10),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("NAME: ${a[i]["name"]}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                Text("COMPANY: ${a[i]["company"]}",style: TextStyle(fontSize: 25,),),
                Text("${a[i]["id"]}",style: TextStyle(fontSize: 20),),

                Text("${a[i]["orderId"]}",style: TextStyle(fontSize: 20,),),
                Text("${a[i]["invoicepaid"]}",style: TextStyle(fontSize: 20,),),
                Text("${a[i]["invoicePending"]}",style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
        );

      }),
    );
  }
   getUserData() async{
     var response=await http.get(Uri.https('run.mocky.io', 'v3/f3feef1c-9bfa-43fd-b2a0-bbe9abadb4f6'));
     var jsonData=jsonDecode(response.body);
     // var k;
     // for(var u in jsonData){
     //   k=u;
     // }
     a=jsonData["clients"];
     setState(() {
     });

   }
}


