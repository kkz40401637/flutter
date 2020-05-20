import 'package:json_annotation/json_annotation.dart';

part 'batch_data.g.dart';

@JsonSerializable()
class BatchData {
  Data data;
  Devices devices;

  BatchData({this.data, this.devices});

  factory BatchData.fromJson(Map<String, dynamic> json) =>
      _$BatchDataFromJson(json);
  Map<String, dynamic> toJson() => _$BatchDataToJson(this);
}

class Data {
  int total;
  int page;
  int size;
  List<Devices> devices;

  Data({this.total, this.page, this.size, this.devices});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    size = json['size'];
    if (json['devices'] != null) {
      devices = new List<Devices>();
      json['devices'].forEach((v) {
        devices.add(new Devices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['page'] = this.page;
    data['size'] = this.size;
    if (this.devices != null) {
      data['devices'] = this.devices.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Devices {
  int id;
  String sno;
  String batchNumber;
  String name;
  int status;
  String address;
  int timeout;
  double longitude;
  double latitude;
  int createTime;
  int proto;
  int maptype;

  Devices(
      {this.id,
      this.sno,
      this.batchNumber,
      this.name,
      this.status,
      this.address,
      this.timeout,
      this.longitude,
      this.latitude,
      this.createTime,
      this.proto,
      this.maptype});

  Devices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sno = json['sno'];
    batchNumber = json['batchNumber'];
    name = json['name'];
    status = json['status'];
    address = json['address'];
    timeout = json['timeout'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    createTime = json['createTime'];
    proto = json['proto'];
    maptype = json['maptype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sno'] = this.sno;
    data['batchNumber'] = this.batchNumber;
    data['name'] = this.name;
    data['status'] = this.status;
    data['address'] = this.address;
    data['timeout'] = this.timeout;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['createTime'] = this.createTime;
    data['proto'] = this.proto;
    data['maptype'] = this.maptype;
    return data;
  }
}
