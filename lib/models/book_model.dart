import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Book {
  @HiveField(0)
  String title;
  @HiveField(1)
  String coverImageUrl;
  @HiveField(2)
  double priceInDollar;
  @HiveField(3)
  List<String>? categories;
  @HiveField(4)
  List<String>? availableFormat;

  Book({
    required this.title,
    required this.coverImageUrl,
    required this.priceInDollar,
    this.categories,
    this.availableFormat,
  });

  @override
  String toString() => title;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}
