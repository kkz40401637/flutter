import 'package:json_annotation/json_annotation.dart';

part 'device_data_current.g.dart';

@JsonSerializable()
class DeviceDataCurrent {
  Data data;

  DeviceDataCurrent({this.data});

  factory DeviceDataCurrent.fromJson(Map<String, dynamic> json) =>
      _$DeviceDataCurrentFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceDataCurrentToJson(this);
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
  String name;
  String sno;
  List<Datapoints> datapoints;

  Devices({this.id, this.name, this.sno, this.datapoints});

  Devices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sno = json['sno'];
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
    data['sno'] = this.sno;
    if (this.datapoints != null) {
      data['datapoints'] = this.datapoints.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Datapoints {
  int type;
  String value;
  int ct;
  int id;
  String name;
  String uint;

  Datapoints({this.type, this.value, this.ct, this.id, this.name, this.uint});

  Datapoints.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    ct = json['ct'];
    id = json['id'];
    name = json['name'];
    uint = json['uint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['value'] = this.value;
    data['ct'] = this.ct;
    data['id'] = this.id;
    data['name'] = this.name;
    data['uint'] = this.uint;
    return data;
  }
}
