import 'package:flutter/material.dart';

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
  int _counter = 0;

  void _incCnt() {
    setState(() {
      _counter ++;
    });
  }

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
            Text('$_counter', style: TextStyle(fontSize: 24),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incCnt,
        child: Icon(Icons.add),
      ),
    );
  }
}
