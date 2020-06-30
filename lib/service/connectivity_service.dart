

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:fluttercheckconnection/enum/connectivitystatus.dart';

class ConnectivityService {
  // Create our public controller
  StreamController<ConnectivityStatus> connectionStatusController = StreamController<ConnectivityStatus>();


  ConnectivityService(){
      Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
        // Use Connectivity() here to gather more info if you need t
        connectionStatusController.add(_getStatusFromResult(result));
      });
  }




  //Convert form the third pard enum to our own enum
    ConnectivityStatus _getStatusFromResult(ConnectivityResult result){
      switch (result) {
        case ConnectivityResult.mobile:
          return ConnectivityStatus.Cellular;
        case ConnectivityResult.wifi:
          return ConnectivityStatus.Wifi;
        case ConnectivityResult.none:
          return ConnectivityStatus.Offline;
        default:
          return ConnectivityStatus.Offline;
      }
    }

}