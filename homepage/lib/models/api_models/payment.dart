// 1
import 'package:json_annotation/json_annotation.dart';

// 2
part 'payment.g.dart';

// 3
@JsonSerializable()
class Payment {
  // 5
  int id;
  String name;
  String norek;
  @JsonKey(name: 'atas_nama')
  String atasNama;
  String type;
  String image;
  bool status;
  String start;
  String end;

  // 6
  Payment(
      {this.atasNama,
      this.end,
      this.id,
      this.image,
      this.name,
      this.norek,
      this.start,
      this.status,
      this.type});

  // 7
  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  // 8
  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
