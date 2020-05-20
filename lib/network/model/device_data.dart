import 'package:json_annotation/json_annotation.dart';

part 'device_data.g.dart';

@JsonSerializable()
class DeviceData {
  Data data;
  List<Datapoints> datapoints;

  DeviceData({this.data, this.datapoints});

  factory DeviceData.fromJson(Map<String, dynamic> json) =>
      _$DeviceDataFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceDataToJson(this);
}

class Data {
  int id;
  String name;
  int proto;
  int createTime;
  int status;
  double longitude;
  double latitude;
  int timeout;
  int maptype;
  List<Datapoints> datapoints;

  Data(
      {this.id,
      this.name,
      this.proto,
      this.createTime,
      this.status,
      this.longitude,
      this.latitude,
      this.timeout,
      this.maptype,
      this.datapoints});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    proto = json['proto'];
    createTime = json['createTime'];
    status = json['status'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    timeout = json['timeout'];
    maptype = json['maptype'];
    if (json['datapoints'] != null) {
      datapoints = new List<Datapoints>();
      json['datapoints'].forEach((v) {
        datapoints.add(new Datapoints.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['proto'] = this.proto;
    data['createTime'] = this.createTime;
    data['status'] = this.status;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['timeout'] = this.timeout;
    data['maptype'] = this.maptype;
    if (this.datapoints != null) {
      data['datapoints'] = this.datapoints.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Datapoints {
  int id;
  String name;
  String unit;
  int slaveAddress;
  int registerType;
  String registerAddress;
  int decimal;
  double minimum;
  double maximum;
  double minimumOriginal;
  double maximumOriginal;

  int dataFormat;
  int dataBit;
  int byteOrder;
  int cycle;
  int status;
  bool collect;
  String value;
  int ct;
  int type;

  Datapoints(
      {this.id,
      this.name,
      this.unit,
      this.slaveAddress,
      this.registerType,
      this.registerAddress,
      this.decimal,
      this.minimum,
      this.maximum,
      this.minimumOriginal,
      this.maximumOriginal,
      this.dataFormat,
      this.dataBit,
      this.byteOrder,
      this.cycle,
      this.status,
      this.collect,
      this.value,
      this.ct,
      this.type});

  Datapoints.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    unit = json['unit'];
    slaveAddress = json['slaveAddress'];
    registerType = json['registerType'];
    registerAddress = json['registerAddress'];
    decimal = json['decimal'];
    minimum = json['minimum'];
    maximum = json['maximum'];
    minimumOriginal = json['minimumOriginal'];
    maximumOriginal = json['maximumOriginal'];

    dataFormat = json['dataFormat'];
    dataBit = json['dataBit'];
    byteOrder = json['byteOrder'];
    cycle = json['cycle'];
    status = json['status'];
    collect = json['collect'];
    value = json['value'];
    ct = json['ct'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['unit'] = this.unit;
    data['slaveAddress'] = this.slaveAddress;
    data['registerType'] = this.registerType;
    data['registerAddress'] = this.registerAddress;
    data['decimal'] = this.decimal;
    data['minimum'] = this.minimum;
    data['maximum'] = this.maximum;
    data['minimumOriginal'] = this.minimumOriginal;
    data['maximumOriginal'] = this.maximumOriginal;

    data['dataFormat'] = this.dataFormat;
    data['dataBit'] = this.dataBit;
    data['byteOrder'] = this.byteOrder;
    data['cycle'] = this.cycle;
    data['status'] = this.status;
    data['collect'] = this.collect;
    data['value'] = this.value;
    data['ct'] = this.ct;
    data['type'] = this.type;
    return data;
  }
}
