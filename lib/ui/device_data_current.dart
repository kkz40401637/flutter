import 'package:flutter/material.dart';
import 'package:hanseinthantiot/network/api_service.dart';
import 'package:hanseinthantiot/network/model/device_data_current.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CurrentData extends StatelessWidget {
  final int id;
  const CurrentData({Key key, this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: /*Text("${id}"),
    );*/
          Scaffold(
        appBar: AppBar(
          title: Text("title"),
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: _deviceCurrentDetail(context),
        ),
      ),
    );
  }

  FutureBuilder _deviceCurrentDetail(BuildContext context) {
    return FutureBuilder<DeviceDataCurrent>(
      future: Provider.of<ApiService>(context, listen: false)
          .getDeviceDataPoint(id),
      builder:
          (BuildContext context, AsyncSnapshot<DeviceDataCurrent> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("Wrong $snapshot"),
              ),
            );
          }
          final currentDetailPoints = snapshot.data;
          return _DeviceCurrentDetail(
              context: context, currentDetailPoints: currentDetailPoints);
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

  ListView _DeviceCurrentDetail(
      {BuildContext context,
      DeviceDataCurrent data,
      DeviceDataCurrent currentDetailPoints}) {
    final f = new DateFormat('yyyy-MM-dd hh:mm');
    // DeviceData deviceData = DeviceData();
    return ListView.builder(
      itemCount: currentDetailPoints.data.devices.length,
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Card(
            margin: EdgeInsets.all(10.0),
            child: Container(
                child: Column(
              children: <Widget>[
                Text(
                    "${currentDetailPoints.data.devices[index].datapoints[index].value}"),
                Text(
                  f.format(new DateTime.fromMillisecondsSinceEpoch(
                      currentDetailPoints
                              .data.devices[index].datapoints[index].ct *
                          1000)),
                )
              ],
            )),
          ),
        );
      },
    );
  }
}
