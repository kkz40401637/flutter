import 'package:json_annotation/json_annotation.dart';

part 'device_data_list.g.dart';

@JsonSerializable()
class DeviceDataList {
  Data data;

  DeviceDataList({this.data});

  factory DeviceDataList.fromJson(Map<String, dynamic> json) =>
      _$DeviceDataListFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceDataListToJson(this);
}

class Data {
  String cursor;
  List<Datapoints> datapoints;

  Data({this.cursor, this.datapoints});

  Data.fromJson(Map<String, dynamic> json) {
    cursor = json['cursor'];
    if (json['datapoints'] != null) {
      datapoints = new List<Datapoints>();
      json['datapoints'].forEach((v) {
        datapoints.add(new Datapoints.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cursor'] = this.cursor;
    if (this.datapoints != null) {
      data['datapoints'] = this.datapoints.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Datapoints {
  int id;
  List<Datastreams> datastreams;

  Datapoints({this.id, this.datastreams});

  Datapoints.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['datastreams'] != null) {
      datastreams = new List<Datastreams>();
      json['datastreams'].forEach((v) {
        datastreams.add(new Datastreams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.datastreams != null) {
      data['datastreams'] = this.datastreams.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Datastreams {
  int type;
  String value;
  int ct;

  Datastreams({this.type, this.value, this.ct});

  Datastreams.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    ct = json['ct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['value'] = this.value;
    data['ct'] = this.ct;
    return data;
  }
}
