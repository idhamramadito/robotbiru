// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetched_data_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchedDataList<T> _$FetchedDataListFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object json) fromJsonT,
) {
  return FetchedDataList<T>(
    message: json['message'] as String,
    result: (json['result'] as List)?.map(fromJsonT)?.toList(),
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$FetchedDataListToJson<T>(
  FetchedDataList<T> instance,
  Object Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result?.map(toJsonT)?.toList(),
    };
