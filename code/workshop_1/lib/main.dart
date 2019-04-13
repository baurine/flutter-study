import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter workshop',
      theme: ThemeData(
        primaryColor: Colors.green
      ),
      home: MyScaffold(),
    );
  }
}

class MyScaffold extends StatefulWidget {
  @override
  MyScaffoldState createState() => MyScaffoldState();
}

class MyScaffoldState extends State<MyScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter workshop'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('you clicked', style: TextStyle(fontSize: 24),),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  void loadData() async {
    try {
      Response response = await Dio().get("http://www.mocky.io/v2/5cb1cdcf330000d81f5720ea");
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
