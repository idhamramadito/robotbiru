// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return Payment(
    atasNama: json['atas_nama'] as String,
    end: json['end'] as String,
    id: json['id'] as int,
    image: json['image'] as String,
    name: json['name'] as String,
    norek: json['norek'] as String,
    start: json['start'] as String,
    status: json['status'] as bool,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'norek': instance.norek,
      'atas_nama': instance.atasNama,
      'type': instance.type,
      'image': instance.image,
      'status': instance.status,
      'start': instance.start,
      'end': instance.end,
    };
