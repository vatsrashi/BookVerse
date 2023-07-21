// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookAdapter extends TypeAdapter<Book> {
  @override
  final int typeId = 1;

  @override
  Book read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Book(
      title: fields[0] as String,
      coverImageUrl: fields[1] as String,
      priceInDollar: fields[2] as double,
      categories: (fields[3] as List?)?.cast<String>(),
      availableFormat: (fields[4] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Book obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.coverImageUrl)
      ..writeByte(2)
      ..write(obj.priceInDollar)
      ..writeByte(3)
      ..write(obj.categories)
      ..writeByte(4)
      ..write(obj.availableFormat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      title: json['title'] as String,
      coverImageUrl: json['cover_image_url'] as String,
      priceInDollar: (json['price_in_dollar'] as num).toDouble(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      availableFormat: (json['available_format'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'title': instance.title,
      'cover_image_url': instance.coverImageUrl,
      'price_in_dollar': instance.priceInDollar,
      'categories': instance.categories,
      'available_format': instance.availableFormat,
    };
