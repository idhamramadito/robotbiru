// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$APIService extends APIService {
  _$APIService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = APIService;

  @override
  Future<Response<FetchedDataList<dynamic>>> getAirlines() {
    final $url = 'ticket/flight/airline';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<FetchedDataList<dynamic>, FetchedDataList<dynamic>>($request);
  }

  @override
  Future<Response<FetchedDataList<dynamic>>> getAirports() {
    final $url = 'ticket/flight/airport';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<FetchedDataList<dynamic>, FetchedDataList<dynamic>>($request);
  }

  @override
  Future<Response<FetchedDataList<dynamic>>> getFlightPayment() {
    final $url = 'ticket/flight/payment';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<FetchedDataList<dynamic>, FetchedDataList<dynamic>>($request);
  }

  @override
  Future<Response<FetchedDataList<dynamic>>> getTrainPayment() {
    final $url = 'ticket/train/payment';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<FetchedDataList<dynamic>, FetchedDataList<dynamic>>($request);
  }
}
