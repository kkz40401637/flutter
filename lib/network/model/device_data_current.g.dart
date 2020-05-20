// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_data_current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceDataCurrent _$DeviceDataCurrentFromJson(Map<String, dynamic> json) {
  return DeviceDataCurrent(
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeviceDataCurrentToJson(DeviceDataCurrent instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
