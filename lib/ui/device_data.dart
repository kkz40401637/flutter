import 'package:flutter/material.dart';
import 'package:hanseinthantiot/network/api_service.dart';
import 'package:hanseinthantiot/network/model/device_data.dart';
import 'package:hanseinthantiot/ui/device_data_current.dart';
import 'package:hanseinthantiot/ui/device_data_list.dart';
import 'package:hanseinthantiot/ui/device_map.dart';
import 'package:provider/provider.dart';

class DevicesData extends StatelessWidget {
  final int id;
  const DevicesData({Key key, this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: /*Text("${id}"),
    );*/
          Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: _deviceDetail(context),
        ),
      ),
    );
  }

  FutureBuilder _deviceDetail(BuildContext context) {
    return FutureBuilder<DeviceData>(
      future: Provider.of<ApiService>(context, listen: false).getDeviceData(id),
      builder: (BuildContext context, AsyncSnapshot<DeviceData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("Wrong $snapshot"),
              ),
            );
          }
          final deviceDetails = snapshot.data;
          return _DeviceDetail(context: context, deviceDetails: deviceDetails);
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  ListView _DeviceDetail(
      {BuildContext context, DeviceData data, DeviceData deviceDetails}) {

    return ListView.builder(
      itemCount: deviceDetails.data.datapoints.length,
      itemBuilder: (BuildContext context, int index) {
        //DeviceDataCurrent deviceDataCurrent = DeviceDataCurrent();


        var _onOff = deviceDetails.data.datapoints[index].registerType;
        if (deviceDetails.data.datapoints[index].registerType == 2 ){
          Text("Read Only(01)");
        }else if(deviceDetails.data.datapoints[index].registerType == 4){
          Text("Write Only(04)");
        }else if(deviceDetails.data.datapoints[index].registerType==17){
          Text("Read&Write Switch(01/05)");
        }else{
          Text("Read&Write Register(03/06)");
        }

        bool _vonOff;
        if (deviceDetails.data.datapoints[index].value == 1) {
          _vonOff = true;
        } else {
          _vonOff = false;
        }

        return Center(
          child: Card(
            margin: EdgeInsets.all(10.0),
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            deviceDetails.data.datapoints[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          Text("$_onOff"),
                          Text(_vonOff ? "OFF" : "ON")
    ],
                      ),

                      /*ListTile(
                        title: Text(
                          deviceDetails.data.datapoints[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(onOff()),
                      ),*/
                    ),
                    Card(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.map,
                                color: Colors.blueAccent,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DeviceMap()));
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.pie_chart,
                                color: Colors.blueAccent,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CurrentData(
                                      id: deviceDetails.data.id,
                                    ),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.list,
                                color: Colors.blueAccent,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ListData(
                                      id: deviceDetails.data.id,
                                      pId: deviceDetails
                                          .data.datapoints[index].id,
                                      sTime: deviceDetails.data.createTime,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              /*
              child: ListTile(
                title: Text(
                  deviceDetails.data.datapoints[index].name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                subtitle: Text(deviceDetails.data.datapoints[index].value),
                */ /* onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeviceDetail(
                        id: deviceDetails.data.id,
                      ),
                    ),
                  );
                },*/ /*
              ),*/
            ),
          ),
        );
      },
    );
  }
}
