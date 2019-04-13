import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:workshop_1/model/user.dart';

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
  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter workshop'),
      ),
      body: user == null ? 
      _loading() :
      _userContent(),
    );
  }

  Widget _loading() {
    return Center(
      child: Text('loading...'),
    );
  }

  Widget _userContent() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text(user.data.name, style: TextStyle(color: Colors.black, fontSize: 24.0),),
          SizedBox(height: 20.0,),
          Text(user.data.email, style: TextStyle(color: Colors.black, fontSize: 15.0)),
          SizedBox(height: 20.0,),
          SizedBox(
            height: 250.0 * user.data.pics.length,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: user.data.pics.length,
              itemBuilder: (BuildContext context, int index) {
                return Image(
                  image: NetworkImage(user.data.pics[index]),
                  width: 400.0,
                  height: 250.0,
                  fit: BoxFit.cover
                );
              },
            ),
          )
        ],
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
      Response response = await Dio().get("http://www.mocky.io/v2/5cb1cdcf330000d81f5720ea?mocky-delay=2000ms");
      // print(response);
      // print(response.data);
      // print(response.data['data']);
      User _user = User.fromJson(response.data);
      print(_user.data.email);
      setState(() {
        user = _user;
      });
    } catch (e) {
      print(e);
    }
  }
}
