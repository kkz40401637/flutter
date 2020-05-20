import 'package:flutter/material.dart';
import 'package:hanseinthantiot/network/api_service.dart';
import 'package:hanseinthantiot/network/model/device_data_list.dart';
import 'package:provider/provider.dart';

class ListData extends StatelessWidget {
  final int id, pId, sTime;
  const ListData({Key key, this.id, this.pId, this.sTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: /*Text("${id}"),
    );*/
          Scaffold(
              backgroundColor: Colors.white,
              body: Container(child: _listDataStream(context))),
    );
  }

  FutureBuilder _listDataStream(BuildContext context) {
    return FutureBuilder<DeviceDataList>(
      future: Provider.of<ApiService>(context, listen: true)
          .getDataPoint(id, pId, sTime),
      builder: (BuildContext context, AsyncSnapshot<DeviceDataList> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("Wrong $snapshot"),
              ),
            );
          }
          final listDataPoint = snapshot.data;
          return _DataStreamList(
              context: context, listDataPoint: listDataPoint);
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

  ListView _DataStreamList(
      {BuildContext context,
      DeviceDataList data,
      DeviceDataList listDataPoint}) {
    return ListView.builder(
      itemCount: listDataPoint.data.datapoints.length,
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Card(
            margin: EdgeInsets.all(10.0),
            child: Container(
              child: ListTile(
                title: Text(
                  listDataPoint.data.datapoints[index].id.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                subtitle: Text(listDataPoint
                    .data.datapoints[index].datastreams[index].value),
                /* onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DeviceDatasPoint(id: deviceDataDetails.data.id),
                    ),
                  );
                },*/
              ),
            ),
          ),
        );
      },
    );
  }
}
