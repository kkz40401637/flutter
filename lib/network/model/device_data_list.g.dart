// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_data_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceDataList _$DeviceDataListFromJson(Map<String, dynamic> json) {
  return DeviceDataList(
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeviceDataListToJson(DeviceDataList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
