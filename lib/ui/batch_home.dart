import 'package:flutter/material.dart';
import 'package:hanseinthantiot/network/api_service.dart';
import 'package:hanseinthantiot/network/model/batch_data.dart';
import 'package:hanseinthantiot/ui/device_data.dart';
import 'package:provider/provider.dart';

class BatchHome extends StatefulWidget {
  @override
  _BatchHomeState createState() => _BatchHomeState();
}

class _BatchHomeState extends State<BatchHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Title'),
      ),
      body: _dataList(context),
    );
  }

  FutureBuilder _dataList(BuildContext context) {
    return FutureBuilder<BatchData>(
      future: Provider.of<ApiService>(context, listen: false).getDevices(),
      builder: (BuildContext context, AsyncSnapshot<BatchData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("Wrong"),
              ),
            );
          }
          final devicesList = snapshot.data;
          return _dataLists(context: context, devicesList: devicesList);
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

  ListView _dataLists({BuildContext context, BatchData devicesList}) {
    //final f = new DateFormat('yyyy-MM-dd hh:mm');
    return ListView.builder(
      itemCount: devicesList.data.devices.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Container(
              child: ListTile(
                /* children: <Widget>[
                  Text(devicesList.data.devices[index].name),
                  Text(devicesList.data.devices[index].address),
                  Text(
                    f.format(new DateTime.fromMillisecondsSinceEpoch(
                        devicesList.data.devices[index].createTime * 1000)),
                  ),

                ],*/

                title: Text(devicesList.data.devices[index].name),
                subtitle: Text(devicesList.data.devices[index].address),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DevicesData(
                        id: devicesList.data.devices[index].id,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
