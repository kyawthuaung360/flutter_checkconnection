import 'package:flutter/material.dart';
import 'package:fluttercheckconnection/enum/connectivitystatus.dart';
import 'package:fluttercheckconnection/service/connectivity_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
      create: (context)=> ConnectivityService().connectionStatusController.stream,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color wifi_color = Colors.black,
      cellular_color = Colors.black,
      offline_color = Colors.grey;


  @override
  Widget build(BuildContext context) {

    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    if(connectionStatus == ConnectivityStatus.Wifi){
      wifi_color = Colors.red;
      offline_color = Colors.black;
    }
    if(connectionStatus == ConnectivityStatus.Cellular){
      cellular_color = Colors.red;
      offline_color = Colors.black;
    }

    if(connectionStatus == ConnectivityStatus.Offline){
      offline_color = Colors.red;
      wifi_color = Colors.black;
      cellular_color = Colors.black;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.wifi,color: wifi_color,),
            Text('Wifi Access',
              style: TextStyle(color: Colors.black),),
          ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.network_cell,color: cellular_color,),
              Text('Cellular Access',
                style: TextStyle(color: Colors.black),),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.offline_bolt,color: offline_color,),
              Text('No internet Access',
                style: TextStyle(color: Colors.black),),
            ],
          )
        ],
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
