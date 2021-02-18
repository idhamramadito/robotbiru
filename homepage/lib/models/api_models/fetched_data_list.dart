import 'package:homepage/models/api_models/airport.dart';
import 'package:homepage/models/api_models/payment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fetched_data_list.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class FetchedDataList<T> {
  String status;
  String message;
  List<T> result;
  FetchedDataList({this.message, this.result, this.status});

  factory FetchedDataList.fromJson(
    Map<String, dynamic> json,
    T Function(Object json) fromJsonT,
  ) =>
      _$FetchedDataListFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$FetchedDataListToJson(this, toJsonT);
}
