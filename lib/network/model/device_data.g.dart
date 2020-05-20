// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceData _$DeviceDataFromJson(Map<String, dynamic> json) {
  return DeviceData(
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    datapoints: (json['datapoints'] as List)
        ?.map((e) =>
            e == null ? null : Datapoints.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DeviceDataToJson(DeviceData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'datapoints': instance.datapoints,
    };
