import 'package:homepage/models/api_models/airport.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fetched_data_list.g.dart';

@JsonSerializable()
class FetchedDataList {
  String status;
  String message;
  List<Airport> result;
  // List<Airline> result;

  FetchedDataList({this.message, this.result, this.status});
  factory FetchedDataList.fromJson(Map<String, dynamic> json) =>
      _$FetchedDataListFromJson(json);

  Map<String, dynamic> toJson() => _$FetchedDataListToJson(this);
}
