// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchData _$BatchDataFromJson(Map<String, dynamic> json) {
  return BatchData(
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    devices: json['devices'] == null
        ? null
        : Devices.fromJson(json['devices'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BatchDataToJson(BatchData instance) => <String, dynamic>{
      'data': instance.data,
      'devices': instance.devices,
    };
